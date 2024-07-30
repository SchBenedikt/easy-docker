#!/bin/bash

sudo docker container run -d \
  --name dash-container \
  -p 80:3001 \
  -v /:/mnt/host:ro \
  --privileged \
  mauricenino/dashdot
