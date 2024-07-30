#!/bin/bash

ORDNERNAME="opengist"

USERNAME=$USER

mkdir -p /home/$USERNAME/$ORDNERNAME

cd /home/$USERNAME/$ORDNERNAME

wget https://raw.githubusercontent.com/SchBenedikt/easy-docker/main/opengist/docker-compose.yml

if [ $? -eq 0 ]; then
    echo "Die Datei wurde erfolgreich heruntergeladen und befindet sich in /home/$USERNAME/$ORDNERNAME/docker-compose.yml"
    
    # Ausführen von 'sudo docker compose up -d'
    sudo docker compose up -d
    
    if [ $? -eq 0 ]; then
        echo "'sudo docker compose up -d' wurde erfolgreich ausgeführt."
    else
        echo "Beim Ausführen von 'sudo docker compose up -d' ist ein Fehler aufgetreten."
    fi
else
    echo "Beim Herunterladen der Datei ist ein Fehler aufgetreten."
fi
