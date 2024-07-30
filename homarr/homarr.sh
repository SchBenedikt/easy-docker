#!/bin/bash

ORDNERNAME="homarr"

USERNAME=$USER

mkdir -p /home/$USERNAME/$ORDNERNAME

cd /home/$USERNAME/$ORDNERNAME

wget https://raw.githubusercontent.com/SchBenedikt/easy-docker/main/opengist/docker-compose.yml

if [ $? -eq 0 ]; then
    echo -e "\e[32mThe file has been successfully downloaded and is located at /home/$USERNAME/$ORDNERNAME/docker-compose.yml\e[0m"

    sudo docker compose up -d
    
    if [ $? -eq 0 ]; then
        echo -e "\e[32m'sudo docker compose up -d' has been successfully executed.\e[0m"
    else
        echo -e "\e[31mAn error occurred while executing 'sudo docker compose up -d'.\e[0m"
    fi
else
    echo -e "\e[31mAn error occurred while downloading the file.\e[0m"
fi
