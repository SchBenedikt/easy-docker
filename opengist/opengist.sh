#!/bin/bash

ORDNERNAME="opengist"

USERNAME=$USER

mkdir -p /home/$USERNAME/opengist

cd /home/$USERNAME/opengist

wget https://raw.githubusercontent.com/SchBenedikt/easy-docker/main/opengist/docker-compose.yml

if [ $? -eq 0 ]; then
    echo "Die Datei wurde erfolgreich heruntergeladen und befindet sich in /home/$USERNAME/opengist/docker-compose.yml"
else
    echo "Beim Herunterladen der Datei ist ein Fehler aufgetreten."
fi
