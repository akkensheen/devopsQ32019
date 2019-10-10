#!/bin/bash/env bash

curl https://github.com/docker/compose/tags -o tags.html \
    && raw=$(cat tags.html | grep -m1 /tag/[0-9]\.[0-9][0-9]\.[0-9][^-rc0-9]) \
    && trim_left=${raw##*/} \
    && version=${trim_left%%\"*} \
    && curl -L "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose-$version \
    && chmod +x /usr/local/bin/docker-compose-$version \
    && if [[ -h /usr/bin/docker-compose ]]; then rm /usr/bin/docker-compose; fi \
    && ln -s /usr/local/bin/docker-compose-$version /usr/bin/docker-compose \
    && docker-compose --version
