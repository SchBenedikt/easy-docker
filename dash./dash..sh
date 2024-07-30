#!/bin/bash

sudo docker container run -d \
  --name dash. \
  -p 80:3001 \
  -v /:/mnt/host:ro \
  --privileged \
  mauricenino/dashdot
