FROM phase2/servicebase

RUN yum -y install \
      https://www.softwarecollections.org/en/scls/rhscl/php55/epel-7-x86_64/download/rhscl-php55-epel-7-x86_64.noarch.rpm \
      https://www.softwarecollections.org/en/scls/remi/php55more/epel-7-x86_64/download/remi-php55more-epel-7-x86_64.noarch.rpm && \
    yum -y update
RUN yum -y install \
      httpd \
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
      cronolog

RUN ln -sfv /opt/rh/php55/root/usr/bin/* /usr/bin/ && \
    ln -sfv /opt/rh/php55/root/usr/sbin/* /usr/sbin/

EXPOSE 80

COPY root /

VOLUME ["/var/www", "/var/log/httpd"]

ENV PHP_MAX_CHILDREN   2
ENV PHP_MEMORY_LIMIT   256m
ENV PHP_OPCACHE_MEMORY 192