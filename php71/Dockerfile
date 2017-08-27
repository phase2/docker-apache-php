FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      gcc-c++ \
      make \
      php71 \
      php71-php-devel \
      php71-php-gd \
      php71-php-xml \
      php71-php-pdo \
      php71-php-mysql \
      php71-php-mysqlnd \
      php71-php-mbstring \
      php71-php-fpm \
      php71-php-opcache \
      php71-php-pecl-memcache \
      php71-php-pecl-xdebug \
      php71-php-mcrypt
      # There is no PHP 7 support for XHProf yet.
      # php71-php-pecl-xhprof

ENV PHP_HOME /opt/remi/php71
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
    make install

# Install best identified port of XHProf to PHP 7.
# See <issue>
ENV XHPROF_VERSION=1.1
RUN curl -L -o /tmp/xhprof.tar.gz "https://github.com/longxinH/xhprof/archive/v$XHPROF_VERSION.tar.gz" && \
    tar -xzf /tmp/xhprof.tar.gz -C /tmp && \
    rm /tmp/xhprof.tar.gz && \
    cd "/tmp/xhprof-$XHPROF_VERSION/extension" && \
    phpize && \
    ./configure && \
    make && \
    make install

# Cleanup the things needed to build phpredis
RUN yum -y remove gcc-c++ make php71-php-devel; yum clean all

COPY root /
