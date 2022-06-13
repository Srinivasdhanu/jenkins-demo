FROM centos:7

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx curl

ENV NGINX_HOME /usr/sbin
ENV MY_HOME /home
COPY index.html /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html


EXPOSE 80
#ENTRYPOINT ["executable", "arg1"]
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl localhost:80
