FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      gcc-c++ \
      make \
      php72 \
      php72-php-devel \
      php72-php-gd \
      php72-php-xml \
      php72-php-pdo \
      php72-php-mcrypt \
      php72-php-mysql \
      php72-php-mysqlnd \
      php72-php-mbstring \
      php72-php-fpm \
      php72-php-opcache \
      php72-php-pecl-memcache \
      php72-php-pecl-xdebug \
      php72-php-pecl-yaml \
      php72-php-pecl-zip && \
      # There is no PHP 7 support for XHProf yet.
      # php72-php-pecl-xhprof
    yum clean all

ENV PHP_HOME /opt/remi/php72
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
    yum -y remove gcc-c++ make php72-php-devel && \
    yum clean all

COPY root /
