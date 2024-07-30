#!/bin/bash

USERNAME=$(whoami)

FOLDER_NAME="opengist"

TARGET_DIR="/home/$USERNAME/$FOLDER_NAME"

FILE_URL="https://github.com/SchBenedikt/easy-docker/blob/main/opengist/docker-compose.yml"

if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi

cd "$TARGET_DIR"

wget "$FILE_URL"

echo "Datei wurde erfolgreich heruntergeladen in $TARGET_DIR"
