FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      php71 \
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

RUN ln -sfv /opt/remi/php71/root/usr/bin/* /usr/bin/ && \
    ln -sfv /opt/remi/php71/root/usr/sbin/* /usr/sbin/

COPY root /
