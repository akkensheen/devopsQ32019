#!/bin/bash

docker run -it ubuntu bash
docker diff
docker commit $(docker ps -q) ubuntu:modded

docker build -f terraform_build.dockerfile -t terraform:0.12.0
docker build -f terraform_build.dockerfile --build-arg version='0.12.10' -t terraform:latest

docker run terraform:0.12.0 -v ; docker run terraform:0.12.0 --help
docker run terraform:latest -v ; docker run terraform:latest --help

docker history ubuntu
docker history terraform:0.12.0
docker history terraform:latest

docker inspect terraform:latest
docker inspect terraform:latest -f "{{ .RootFS.Layers }}"
docker inspect terraform:latest -f "{{ .Config.Labels.version }}"

docker run -d -p 8080:8080 --name=web01 --network-alias=web01 web:0.1
docker run -d -p 8081:8080 --name=web02 --network-alias=web02 web:0.1
docker inspect $(docker ps -q) -f "{{ .NetworkSettings.Networks.bridge.IPAddress}}"
docker inspect $(docker ps -q) -f "{{ .NetworkSettings.Networks.bridge.Aliases}}"
docker exec -it web01 bash
docker exec web01 ping web02
docker exec web01 ping $(docker inspect web02 -f "{{ .NetworkSettings.Networks.bridge.IPAddress}}")

docker network create vNet01
docker run -d -p 8080:8080 --name=web01 --network=vNet01 --network-alias=web01 web:0.1
docker run -d -p 8081:8080 --name=web02 --network=vNet01 --network-alias=web02 web:0.1
docker inspect $(docker ps -q) -f "{{ .NetworkSettings.Networks.vNet01.IPAddress}}"
docker inspect $(docker ps -q) -f "{{ .NetworkSettings.Networks.vNet01.Aliases}}"
docker exec web01 ping web02
docker exec web01 ping $(docker inspect web02 -f "{{ .NetworkSettings.Networks.vNet01.IPAddress}}")
