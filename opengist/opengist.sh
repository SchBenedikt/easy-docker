#!/bin/bash

# Definieren von Benutzernamen und Ordnernamen
USERNAME="benedikt"
ORDNERNAME="ORDNERNAME"

# Erstellen des Ordners
mkdir -p /home/$USERNAME/$ORDNERNAME

# Wechseln in den erstellten Ordner
cd /home/$USERNAME/$ORDNERNAME

# Herunterladen der Datei docker-compose.yml
wget https://raw.githubusercontent.com/SchBenedikt/easy-docker/main/opengist/docker-compose.yml

# Bestätigung der erfolgreichen Ausführung
if [ $? -eq 0 ]; then
    echo "Die Datei wurde erfolgreich heruntergeladen und befindet sich in /home/$USERNAME/$ORDNERNAME/docker-compose.yml"
else
    echo "Beim Herunterladen der Datei ist ein Fehler aufgetreten."
fi
