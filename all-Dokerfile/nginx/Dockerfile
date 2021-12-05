FROM debian:stretch

LABEL vendor="nesle1936" \
      version="1.0" \
      description="image base on Debian with Nginx"

RUN apt-get update && \
    apt-get install -y nginx

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/usr/sbin/nginx"]
