FROM almalinux:8

RUN dnf -y update
RUN dnf -y install httpd

COPY ./web /var/www/html
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
