FROM outrigger/apache-php-base

RUN yum -y install \
      http://rpms.remirepo.net/enterprise/7/remi/x86_64/remi-release-7.1-3.el7.remi.noarch.rpm && \
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

RUN ln -sfv /opt/remi/php70/root/usr/bin/* /usr/bin/ && \
    ln -sfv /opt/remi/php70/root/usr/sbin/* /usr/sbin/

COPY root /
