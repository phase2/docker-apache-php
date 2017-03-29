FROM outrigger/apache-php-base

RUN yum -y install \
      https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum -y install \
      php70 \
      php70-php-gd \
      php70-php-xml \
      php70-php-pdo \
      php70-php-mysql \
      php70-php-mysqlnd \
      php70-php-mbstring \
      php70-php-fpm \
      php70-php-opcache \
      php70-php-pecl-memcache \
      php70-php-pecl-xdebug \
      php70-php-mcrypt
      # There is no PHP 7 support for XHProf yet.
      # php70-php-pecl-xhprof

ENV PHP_HOME /opt/remi/php70
RUN ln -sfv ${PHP_HOME}/root/usr/bin/* /usr/bin/ && \
    ln -sfv ${PHP_HOME}/root/usr/sbin/* /usr/sbin/ && \
    ln -svf /dev/stderr /var${PHP_HOME}/log/php-fpm/error.log

COPY root /
