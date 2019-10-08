#!/bin/bash

docker run terraform:0.12.0 -v ; docker run terraform:0.12.0 --help

docker run terraform:latest -v ; docker run terraform:latest --help

docker inspect terraform:latest

docker inspect terraform:latest -f "{{ .RootFS.Layers }}"
docker inspect terraform:latest -f "{{ .Config.Labels.version }}"
