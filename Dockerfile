FROM mediawiki:stable
MAINTAINER Andy Rechenberg (github@rechenberg.net)

RUN apt-get update && apt-get install -y \
                libbz2-dev \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
                libldap-dev \
                libmariadb-dev \
		libmcrypt-dev \
                libonig-dev \
		libpng-dev \
                libpspell-dev \
                libsnmp-dev \
                libxml2-dev \
                unixodbc-dev \
        && pecl install mcrypt-1.0.5 && docker-php-ext-enable mcrypt \
	&& docker-php-ext-install gd \
        && docker-php-ext-install ldap \
        && docker-php-ext-install pspell \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install snmp \
        && docker-php-ext-install bcmath \
        && docker-php-ext-install opcache \
        && docker-php-ext-install soap \
        && docker-php-ext-install xmlrpc

CMD ["apache2-foreground"]
