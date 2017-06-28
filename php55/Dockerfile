FROM outrigger/apache-php-base

RUN yum -y install \
      https://www.softwarecollections.org/en/scls/remi/php55more/epel-7-x86_64/download/remi-php55more-epel-7-x86_64.noarch.rpm && \
    yum -y install \
      gcc-c++ \
      make \
      php55 \
      php55-php-devel \
      php55-php-gd \
      php55-php-xml \
      php55-php-pdo \
      php55-php-mysql \
      php55-php-mbstring \
      php55-php-fpm \
      php55-php-opcache \
      php55-php-pecl-memcache \
      php55-php-pecl-xdebug \
      # The packages below are from php55more.
      php55-php-mcrypt \
      php55-php-pecl-xhprof

ENV PHP_HOME /opt/rh/php55
RUN ln -sfv ${PHP_HOME}/root/usr/bin/* /usr/bin/ && \
    ln -sfv ${PHP_HOME}/root/usr/sbin/* /usr/sbin/ && \
    ln -sfv /dev/stderr ${PHP_HOME}/root/var/log/php-fpm/error.log

# Install phpredis
ENV PHPREDIS_VERSION 3.1.2
RUN curl -L -o /tmp/phpredis.tar.gz "https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz" && \
    tar -xzf /tmp/phpredis.tar.gz -C /tmp && \
    rm /tmp/phpredis.tar.gz && \
    cd "/tmp/phpredis-$PHPREDIS_VERSION" && \
    phpize && \
    ./configure && \
    make && \
    make install

# Cleanup the things needed to build phpredis
RUN yum -y remove gcc-c++ make php55-php-devel; yum clean all

COPY root /
