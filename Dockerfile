FROM quay.io/generic/centos7
LABEL maintainer="Daleep Singh Bais" \
      description="This is a standard httpd image modified to suit deployment on OCP"
ENV DOCROOT=/var/www/html \
    PORT=8080
RUN yum update -y && \
    yum install httpd -y && \
    yum clean all && \
    echo "Welcome to my Domain" > $DOCROOT/index.html 
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf && \
    chgrp -R 0 /run/httpd/ /var/log/httpd && \
    chmod -R g=u /run/httpd/ /var/log/httpd
EXPOSE $PORT
VOLUME /var/www/html
ENTRYPOINT ["/sbin/httpd"]
CMD ["-D","FOREGROUND"]
