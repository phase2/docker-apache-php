FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      gcc-c++ \
      make \
      php74 \
      php74-php-bcmath \
      php74-php-devel \
      php74-php-fpm \
      php74-php-gd \
      php74-php-mbstring \
      php74-php-mcrypt \
      php74-php-pecl-memcached \
      php74-php-mysql \
      php74-php-mysqlnd \
      php74-php-opcache \
      php74-php-pdo \
      php74-php-pecl-xdebug \
      php74-php-xml \
      php74-php-pecl-yaml \
      php74-php-pecl-zip && \
      # There is no PHP 7 support for XHProf yet.
      # php74-php-pecl-xhprof
    yum clean all

ENV PHP_HOME /opt/remi/php74
RUN ln -sfv ${PHP_HOME}/root/usr/bin/* /usr/bin/ && \
    ln -sfv ${PHP_HOME}/root/usr/sbin/* /usr/sbin/ && \
    ln -sfv /dev/stderr /var${PHP_HOME}/log/php-fpm/error.log

# Install phpredis
ENV PHPREDIS_VERSION 3.1.5
RUN curl -L -o /tmp/phpredis.tar.gz "https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz" && \
    tar -xzf /tmp/phpredis.tar.gz -C /tmp && \
    rm /tmp/phpredis.tar.gz && \
    cd "/tmp/phpredis-$PHPREDIS_VERSION" && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    # Clean up build dependencies.
    yum -y remove gcc-c++ make php74-php-devel && \
    yum clean all

COPY root /
