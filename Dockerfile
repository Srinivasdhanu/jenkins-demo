FROM ubuntu:latest
RUN apt-get update && \
    apt-get install build-essential\
    		libpcre3\
		libpcre3-dev\
		zlib1g\
		zlib1g-dev\
		libssl1.1\
		libssl-dev\
		-y &&\
     apt-get clean && rm -rf /var/lib/apt/lists/*
ARG FILENAME="nginx-1.20"
ARG EXTENSION="tar.gz"
ADD https://nginx.org/download/${FILENAME}.${EXTENSION} && rm ${FILENAME}.${EXTENSION}
RUN cd ${FILENAME} && \
     ./configure \
        --sbin-path=/usr/bin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--with-pcre \
	--pid-path=/var/run/nginx.pid \
	--with-http_ssl_module && \
	make && make install
RUN rm -rf /${FILENAME}
EXPOSE 80
CMD ["nginx", "-g", "daemon off"]
