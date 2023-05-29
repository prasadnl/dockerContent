FROM httpd
ENV src "./Case-study app/"
ENV dst "/usr/local/apache2/htdocs/"
COPY ${src} ${dst}
EXPOSE 8080
CMD ["httpd-foreground"]
