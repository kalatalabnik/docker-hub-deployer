#
# Basic Dockerfile for Deployer
#

FROM php:7.3.5

RUN apt update -y && \
	apt install --no-install-recommends -y \
		zip \
		unzip \
		openssh-client \
		rsync && \
	rm -rf /var/lib/apt/lists/* && \
	apt autoremove && \
	apt clean

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	php -r "unlink('composer-setup.php');" && \
	mv composer.phar /usr/local/bin/composer
