ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/php-7.4-fpm:latest

RUN set -xe \
    && apk add --update \
        icu \
    && apk add --no-cache --virtual .php-deps \
        make \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        zlib-dev \
        icu-dev \
        g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
        intl \
    && docker-php-ext-enable intl \
    && { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } \
    && apk del .build-deps \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

RUN apk add --no-cache hiredis-dev=0.13.3-r1 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.8/main \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
    && curl -L "https://github.com/nrk/phpiredis/archive/v1.0.0.zip" \
	--output "/tmp/phpiredis-1.0.0.zip" \
	&& cd /tmp && unzip "/tmp/phpiredis-1.0.0.zip" \
	&& cd phpiredis-1.0.0 \
	&& phpize && ./configure --enable-phpiredis \
	&& make && make install \
	&& cd /tmp && rm -rf phpiredis-1.0.0 phpiredis-1.0.0.zip \
    && docker-php-ext-enable phpiredis \
    && apk del .build-deps

ENV SS_DEFAULT_ADMIN_USERNAME="admin"
ENV SS_DEFAULT_ADMIN_PASSWORD="lag00n"
ENV TEMP_FOLDER="/app/public/assets/tmp"

# Copy silverstripe config entrypoint
COPY lagoon/01-redis.ini /usr/local/etc/php/conf.d
COPY lagoon/ss-config.sh /lagoon/entrypoints/90-ss-config.sh
RUN echo "source /lagoon/entrypoints/90-ss-config.sh" >> /home/.bashrc

COPY --from=cli /app /app
