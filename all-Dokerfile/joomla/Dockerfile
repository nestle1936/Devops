FROM ubuntu/mysql:8.0-20.04_beta
LABEL maintainer="Nestor"

ENV MYSQL_ROOT_PASSWORD=db_password \
    MYSQL_PASSWORD=jl_password \
    MYSQL_USER=jl_user  \
    MYSQL_DATABASE=webserver

RUN mkdir -p /home/app

COPY ./ /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

CMD ["apache2-foreground"]
