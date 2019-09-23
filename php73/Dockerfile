FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      gcc-c++ \
      make \
      php73 \
      php73-php-devel \
      php73-php-gd \
      php73-php-xml \
      php73-php-pdo \
      php73-php-mcrypt \
      php73-php-mysql \
      php73-php-mysqlnd \
      php73-php-mbstring \
      php73-php-fpm \
      php73-php-opcache \
      php73-php-pecl-memcache \
      php73-php-pecl-xdebug \
      php73-php-pecl-yaml \
      php73-php-pecl-zip && \
      # There is no PHP 7 support for XHProf yet.
      # php73-php-pecl-xhprof
    yum clean all

ENV PHP_HOME /opt/remi/php73
RUN ln -sfv ${PHP_HOME}/root/usr/bin/* /usr/bin/ && \
    ln -sfv ${PHP_HOME}/root/usr/sbin/* /usr/sbin/ && \
    ln -sfv /dev/stderr /var${PHP_HOME}/log/php-fpm/error.log

# Install phpredis
ENV PHPREDIS_VERSION 3.1.2
RUN curl -L -o /tmp/phpredis.tar.gz "https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz" && \
    tar -xzf /tmp/phpredis.tar.gz -C /tmp && \
    rm /tmp/phpredis.tar.gz && \
    cd "/tmp/phpredis-$PHPREDIS_VERSION" && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    # Clean up build dependencies.
    yum -y remove gcc-c++ make php73-php-devel && \
    yum clean all

COPY root /
