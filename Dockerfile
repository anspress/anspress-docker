FROM wordpress:latest

# Install wp-cli
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /bin/wp-cli.phar
RUN cd /bin && mv wp-cli.phar wp

RUN apt-get update && apt-get install
RUN apt-get install less

# Install Composer only for development
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./anspress-entrypoint.sh /anspress-entrypoint.sh
RUN chmod +x /anspress-entrypoint.sh
ENTRYPOINT ["/anspress-entrypoint.sh"]

USER www-data

CMD ["apache2-foreground"]