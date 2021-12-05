
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
echo "FROM $IMAGE" >> Dockerfile
echo "ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD" >> Dockerfile
echo "ENV MYSQL_PASSWORD=$MYSQL_PASSWORD" >> Dockerfile
echo "ENV MYSQL_USER=$MYSQL_USER" >> Dockerfile
echo "ENV MYSQL_DATABASE=$MYSQL_DATABASE" >> Dockerfile
echo "RUN mkdir -p /home/$WORKDIR" >> Dockerfile
echo "COPY ./ /home/$WORKDIR" >> Dockerfile
echo "WORKDIR /home/$WORKDIR" >> Dockerfile
echo "EXPOSE $PORT " >> Dockerfile
echo CMD ["apache2-foreground"] >> Dockerfile
echo "Check this informations and answer y(Yes) if correct or no n(No)"
cat Dockerfile
read VALIDATOR
val=y
if [ "$VALIDATOR" ==  $val ]
then
    docker  build -f Dockerfile .
    rm -f Dockerfile
    echo "image cree"
 else
    echo "Please create a new file"
    rm -f Dockerfile
fi
