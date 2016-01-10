FROM phase2/apache24base

RUN yum -y install \
      php55 \
      php55-php-gd \
      php55-php-xml \
      php55-php-pdo \
      php55-php-mysql \
      php55-php-mbstring \
      php55-php-fpm \
      php55-php-mcrypt \
      php55-php-opcache \
      php55-php-pecl-memcache \
      php55-php-pecl-xdebug \
      php55-php-pecl-xhprof

RUN ln -sfv /opt/rh/php55/root/usr/bin/* /usr/bin/ && \
    ln -sfv /opt/rh/php55/root/usr/sbin/* /usr/sbin/ && \
    cp /opt/php-fpm.conf /opt/rh/php55/root/etc/

COPY root /
