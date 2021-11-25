#!/bin/bash
#Author: Nestor
#Date: November 2021

#1. Create a file name Dokerfile
touch Dockerfile

#Declared the variables
echo "what your base image?"
read IMAGE
echo "What is the creator?"
read MAINTEAINER
echo "What is the Root password for database"
read MYSQL_ROOT_PASSWORD
echo "What is the user password for user"
read MYSQL_PASSWORD
echo "What is the User"
read MYSQL_USER
echo "What is the name of your Database"
read MYSQL_DATABASE
echo "What is the name of the work Directorie in your container"
read WORKDIR
echo "What is the port"
read PORT

#Write in the Dokerfile
text= "FROM $IMAGE
    ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
    ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
    ENV MYSQL_USER=$MYSQL_USER
    ENV MYSQL_DATABASE=$MYSQL_DATABASE
    RUN mkdir -p /home/$WORKDIR
    COPY ./ /home/$WORKDIR
    WORKDIR /home/$WORKDIR
    EXPOSE $PORT"
echo "$text" > Dockerfile
echo CMD ["apache2-foreground"] >> Dockerfile
 #Add volume for persistance

echo "Check this informations down there and answer y(Yes) no n(No)"

read VALIDATOR
val=y
if [ "$VALIDATOR" ==  $val ]
then
    docker build -t dockerscript:1.0 .
    rm -f Dockerfile
    echo "image cree"
 else
    echo "Please create a new file"
    rm -f Dockerfile
fi
