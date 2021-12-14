#!/bin/bash
# Author: Nestor
#Github:
# Description: This script is use to create a Docker file and buil the image

#Variables
FROM=''
LABEL=''
WORKDIR=''
EXPOSE=''
VOLUME=''
ENTRYPOINT=''
#from function
function from {
    clear
    echo "Please insert your image"
    read FROM
}
# Mainterner function
function label {
    clear
    echo -e "Please insert your Label. \n If multiple Label, please follow this syntax: \n label1="value1" label2="value2" ..."
    read LABEL
}
# Environment function
function environment {
    clear
    rm -f envifile
    touch envifile
    echo "How many environnement are you use"
    read NUM_ENV
    for (( i = 1; i <= NUM_ENV; i++ ))
    do
        echo "Please insert environment $i"
        read ENV
        echo "ENV $ENV" >> envifile
    done
}
# Copy function
function copy {
    clear
    rm -f copyfile
    touch copyfile
    echo "How many COPY command are you use"
    read NUM_CP
    for (( i = 1; i <= NUM_CP; i++ ))
    do
        echo "Please insert environment $i"
        read COPY
        echo "COPY $COPY" >> copyfile
    done
}
# Run function
function run {
    clear
    rm -f runfile
    touch runfile
    echo "How many command do you want to RUN"
    read NUM_RUN
    for (( i = 1; i <= NUM_RUN; i++ ))
    do
        echo  "Please insert the RUN $i"
        read RUN
        echo "RUN $RUN " >> runfile
    done
}
# Workdir function
function workdir {
    clear
    echo "Please insert the WORKDIR "
    read WORKDIR
}
# Expose function
function expose {
    clear
    rm -f expofile
    touch expofile
    echo "How many port do you want to EXPOSE"
    read NUM_EXPO
    for (( i = 1; i <= NUM_EXPO; i++ ))
    do
        echo "Please insert the PORT $i"
        read EXPOSE
        echo "EXPOSE $EXPOSE" >> expofile
    done
}
# Command function
function cmd {
    clear
    rm -f cmdfile
    touch cmdfile
    echo "How many CMD do you want?"
    read NUM_CMD
    for (( i = 1; i <= NUM_CMD; i++ ))
    do
        echo "Please insert CMD $i"
        read CMD
        echo "CMD $CMD" >> cmdfile
    done
}
# Volume function
function volume {
    clear
    echo "Please insert the VOLUME"
    read VOLUME
}
# Entrypoint function
function entrypoint {
    clear
    echo "Please insert the ENTRYPOINT"
    read ENTRYPOINT
}
# This function is use to create a Dockerfile
function dockerfile {
    rm -f Dockerfile
    touch Dockerfile
    echo "FROM $FROM " >> Dockerfile
    if [ -n "$LABEL" ]
    then
        echo "LABEL $LABEL" >> Dockerfile
    fi
    if [ -f envifile ]
    then
        cat envifile >> Dockerfile
    fi
    if [ -f runfile ]
    then
        cat runfile >> Dockerfile
    fi
    if [ -n "$WORKDIR" ]
    then
        echo "WORKDIR $WORKDIR" >> Dockerfile
    fi
    if [ -f expofile ]
    then
        cat expofile >> Dockerfile
    fi
    if [ -f cmdfile ]
    then
        cat cmdfile >> Dockerfile
    fi
    if [ -n "$VOLUME" ]
    then
        echo "VOLUME $VOLUME" >> Dockerfile
    fi
    if [ -n "$ENTRYPOINT" ]
    then
        echo "ENTRYPOINT [$ENTRYPOINT]" >> Dockerfile
    fi
}
# Display the Dockerfile
function display_dockerfile {
        clear
        echo -e "Your Dockerfile will locks like: \n"
        dockerfile
        cat Dockerfile
}
#delete files
function cleaner {
        rm -f Dockerfile
        rm -f cmdfile
        rm -f runfile
        rm -f envifile
        rm -f expofile
        rm -f copyfile
        rm -f dockerfile
}
# build the image
function build_image {
        clear
        if [ -f Dockerfile ]
        then
                cleaner
                touch Dockerfile
                dockerfile
                echo "how do want to name tour image"
                read IMAGE_NAME
                echo "how do you want to tag your image"
                read TAG_NAME
                docker build -t ${IMAGE_NAME}:${TAG_NAME} .
                sleep 3
                echo "your image is created"
        fi
}
# Menu 
function menu {
        clear
        echo
        echo -e "\t\t\tDockerfile\n"
        echo -e "\t\t\tTo create and run your Docker file hit an number to insert variables\n"
        echo -e "\t00. Exit"
        echo -e "\t01. FROM"
        echo -e "\t02. LABEL"
        echo -e "\t03. ENV"
        echo -e "\t04. RUN"
        echo -e "\t05. WORKDIR"
        echo -e "\t06. EXPOSE"
        echo -e "\t07. COPY"
        echo -e "\t08. CMD"
        echo -e "\t09. VOLUME"
        echo -e "\t10. ENTRYPOINT"
        echo -e "\t11. Display the content of Dockerfile"
        echo -e "\t12. Build my image"
        echo -en "\t\tEnter option: "
        read -n 2 option
}
# Loop for interaction
while [ 1 ]
do
        menu
        case $option in
                00)
                        break ;;
                01)
                        from ;;
                02)
                        label ;;
                03)
                        environment ;;
                04)
                        run ;;
                05)
                        workdir ;;
                06)
                        expose ;;
                07)
                        copy ;;
                08)
                        cmd ;;
                09)
                        volume ;;
                10)
                        entrypoint ;;
                11)
                        display_dockerfile ;;
                12)
                        build_image ;;
                *)
                        clear
                echo "Sorry, wrong selection";;
        esac
        echo -en "\n\n\t\t\tHit any key to continue"
        read -n 1 line
done
cleaner
sleep 2
clear