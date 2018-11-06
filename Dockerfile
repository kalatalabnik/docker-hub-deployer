#
# Basic Dockerfile for Deployer
#

FROM php:7.2.11

RUN apt-get update -y && \
	apt-get install --no-install-recommends -y \
		zip \
		unzip \
		openssh-client \
		rsync && \
		rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	php -r "unlink('composer-setup.php');"
