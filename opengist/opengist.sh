#!/bin/bash

./download_script.sh

if [ $? -eq 0 ]; then
  sudo docker-compose up -d
else
  echo "download_script.sh fehlgeschlagen. Docker Compose wird nicht gestartet."
fi
