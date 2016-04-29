FROM phase2/apache-php-base

RUN yum -y install \
      https://www.softwarecollections.org/en/scls/remi/php56more/epel-7-x86_64/download/remi-php56more-epel-7-x86_64.noarch.rpm && \
    yum -y install \
      rh-php56 \
      rh-php56-php-gd \
      rh-php56-php-xml \
      rh-php56-php-pdo \
      rh-php56-php-mysql \
      rh-php56-php-mbstring \
      rh-php56-php-fpm \
      rh-php56-php-opcache \
      rh-php56-php-pecl-memcache \
      rh-php56-php-pecl-xdebug \
      # The packages below are from php56more.
      more-php56-php-mcrypt \
      more-php56-php-pecl-xhprof

RUN ln -sfv /opt/rh/rh-php56/root/usr/bin/* /usr/bin/ && \
    ln -sfv /opt/rh/rh-php56/root/usr/sbin/* /usr/sbin/

COPY root /
