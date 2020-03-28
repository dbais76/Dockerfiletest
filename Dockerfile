FROM quay.io/generic/centos7
LABEL maintainer="Daleep Singh Bais" \
      description="This is a standard httpd image"
ENV DOCROOT=/var/www/html \
    PORT=80
RUN yum update -y && \
    yum install httpd -y && \
    yum clean all && \
    echo "Welcome to my Domain" > $DOCROOT/index.html
EXPOSE $PORT
VOLUME /var/www/html
ENTRYPOINT ["/sbin/httpd"]
CMD ["-D","FOREGROUND"]
