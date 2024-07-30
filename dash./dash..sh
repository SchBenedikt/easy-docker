#!/bin/bash

# Docker-Container mit den angegebenen Optionen starten
docker container run -it \
  -p 80:3001 \
  -v /:/mnt/host:ro \
  --privileged \
  mauricenino/dashdot
