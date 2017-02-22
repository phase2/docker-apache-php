# Outrigger Apache/PHP

> PHP application server for Apache w/ PHP-FPM

[![](https://images.microbadger.com/badges/version/outrigger/apache-php.svg)](https://microbadger.com/images/outrigger/apache-php
"Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/outrigger/apache-php.svg)](https://microbadger.com/images/outrigger/apache-php
"Get your own image badge on microbadger.com")

An image for running Apache with PHP-FPM based on outrigger/apache-php-base. Includes Apache and default VirtualHost configured
with php-fpm proxy.

For more documentation on how Outrigger images are constructed and how to work with them, please [see the documentation](http://docs.outrigger.sh/).

## Features

See [Apache PHP Base](https://github.com/phase2/docker-apache-php-base) for all Features and Configuration

## Environment Variables

Outrigger images use Environment Variables and [confd](https://github.com/kelseyhightower/confd)
to "templatize" a number of Docker environment configurations. These templates are
processed on startup with environment variables passed in via the docker run
command-line or via your docker-compose manifest file. Here are the "tunable"
configurations offered by this image.

## Security Reports

Please email outrigger@phase2technology.com with security concerns.

## Maintainers

[![Phase2 Logo](https://www.phase2technology.com/wp-content/uploads/2015/06/logo-retina.png)](https://www.phase2technology.com)
