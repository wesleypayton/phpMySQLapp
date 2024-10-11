# Dockerfile
FROM php:8.1-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite (optional, useful for pretty URLs)
RUN a2enmod rewrite