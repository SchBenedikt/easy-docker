#!/bin/bash

# URL der download.sh Datei
DOWNLOAD_SCRIPT_URL="https://raw.githubusercontent.com/SchBenedikt/easy-docker/main/opengist/download.sh"

# Datei lokal speichern
curl -O $DOWNLOAD_SCRIPT_URL

# Datei ausführbar machen
chmod +x download.sh

# download.sh ausführen
./download.sh

# Prüfen, ob download.sh erfolgreich ausgeführt wurde
if [ $? -eq 0 ]; then
  # Ausführen von "sudo docker-compose up -d"
  sudo docker-compose up -d
else
  echo "download.sh fehlgeschlagen. Docker Compose wird nicht gestartet."
fi
