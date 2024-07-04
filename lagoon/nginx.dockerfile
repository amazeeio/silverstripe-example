ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/nginx:latest

COPY lagoon/nginx.conf /etc/nginx/conf.d/app.conf
RUN fix-permissions /etc/nginx

COPY --from=cli /app /app

# Define where the Drupal Root is located
ENV WEBROOT=public
