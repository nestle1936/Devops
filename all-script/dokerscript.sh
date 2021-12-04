#!/bin/bash
#Author: Nestor
#Date: November 2021

#Download and prepare the work place to the web server
#1. Create a work place in local machine
echo "Name your Workdir in your local machine"
read LOCAL_WORKDIR
mkdir $LOCAL_WORKDIR
#2. Move in your workdir
cd $LOCAL_WORKDIR
#3. Create a directory name app to store Website
echo "Please enter the name of your Wep Directory"
read LOCAL_WEBDIR
mkdir $LOCAL_WEBDIR
echo "Copy your web file in this location"
cd ..
echo "......................Docker............................."
#4. Create a file named Dokerfile
echo "Your Dockerfile is created ..."
touch Dockerfile
sleep 3
#5. Specify your apache base image
echo "what your apache base image?"
read IMAGE 
#6. Labeling your container
echo "Who is the Maintainer?"
read MAINTAINER
#7. What the port of webserver
echo "What is the port"
read WEB_PORT
echo "What is the name of the work Directory in your container"
read WORKDIR
#Create Dockerfile
if [ -f Dockerfile ] ;
then

    DOCKERFILE= "FROM $IMAGE
        RUN mkdir -p /home/$WORKDIR
        COPY ./$LOCAL_WEBDIR /usr/local/apache2/htdocs/
        WORKDIR /home/$WORKDIR
        EXPOSE $WEB_PORT"
    echo "$DOCKERFILE" > Dockerfile
    echo CMD ["apache2-foreground"] >> Dockerfile
 #Add volume for persistance
#8. Build image
echo "How do you want to name your image"
read IMAGE_NAME
echo "What is the target name"
read TAG_NAME
echo "Check this informations down there and answer y(Yes) no n(No)"
cat Dockerfile
echo
read VALIDATOR
VAL=y
if [ "$VALIDATOR" ==  $VAL ]
then
    docker build --tag $IMAGE_NAME:$TAG_NAME .
    rm -f Dockerfile
    echo "your image is created"
 else
    echo "Please create a new file"
    rm -f Dockerfile
fi