FROM centos:7

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx curl

ENV NGINX_HOME /usr/sbin
ENV MY_HOME /home
WORKDIR /usr/share/nginx/html
RUN touch /usr/share/nginx/html/index.html && sudo echo "This is my first CI/CD Pipeline Project" > /usr/share/nginx/html/index.html

EXPOSE 80
#ENTRYPOINT ["executable", "arg1"]
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl localhost:80
