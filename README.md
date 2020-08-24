# SilverStripe and Lagoon

This repository is an example of a SilverStripe ([http://silverstripe.org](http://silverstripe.org)) installation with Lagoon.

Required modules are installed via [http://github.com/silverstripe/recipe-cms](http://github.com/silverstripe/recipe-cms). For information on how to change the dependencies in a recipe, please have a look at [https://github.com/silverstripe/recipe-plugin](https://github.com/silverstripe/recipe-plugin). In addition, installer includes [theme/simple](https://github.com/silverstripe-themes/silverstripe-simple) as a default theme.

## Requirements

This project uses Docker & Docker Compose. [See the requirements of Docker and download it here](https://www.docker.com/get-started).

## Installation

Make sure Docker and Docker Compose are installed.
Clone this repo. `cd` into the repo directory and run the following commands:

```bash
cp .env.example .env \
&& docker-compose up -d --build \
&& docker-compose exec cli composer install \
&& docker-compose exec cli composer build
```

Your local site will be available at: http://ss.docker.amazee.io

The temporary username and password are set to:
user: admin
pass: lag00n

See [Getting Started](https://docs.silverstripe.org/en/4/getting_started/) for more information about SilverStripe development.

## What's Next

This example gives you a working *local* project using WordPress and Lagoon. For information about how to deploy your project using Lagoon, [check out our documentation](https://lagoon.readthedocs.io/en/latest/using_lagoon/setup_project/), [watch our deployment demo](https://www.youtube.com/watch?v=XiaH7gqUXWc_), or [chat with us](https://amazeeio.rocket.chat/home)!

## SilverStripe Bugtracker

Bugs are tracked on github.com ([framework issues](https://github.com/silverstripe/silverstripe-framework/issues),
[cms issues](https://github.com/silverstripe/silverstripe-cms/issues)).
Please read our [issue reporting guidelines](https://docs.silverstripe.org/en/4/contributing/issues_and_bugs/).

## SilverStripe Development and Contribution

If you would like to make changes to the SilverStripe core codebase, we have an extensive [guide to contributing code](https://docs.silverstripe.org/en/4/contributing/code/).

## SilverStripe Links

* [Changelogs](https://docs.silverstripe.org/en/4/changelogs/)
* [Bugtracker: Framework](https://github.com/silverstripe/silverstripe-framework/issues)
* [Bugtracker: CMS](https://github.com/silverstripe/silverstripe-cms/issues)
* [Bugtracker: Installer](https://github.com/silverstripe/silverstripe-installer/issues)
* [Forums](http://silverstripe.org/forums)
* [Developer Mailinglist](https://groups.google.com/forum/#!forum/silverstripe-dev)
* [License](./LICENSE)
