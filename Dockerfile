FROM outrigger/apache-php-base

RUN yum -y install \
      https://www.softwarecollections.org/en/scls/remi/php55more/epel-7-x86_64/download/remi-php55more-epel-7-x86_64.noarch.rpm && \
    yum -y install \
      php55 \
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

COPY root /
