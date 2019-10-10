#!/bin/bash/env bash

curl https://releases.hashicorp.com/terraform/ -o tags.html
raw=$(cat tags.html | grep -m1 terraform_)
trim_left=${raw##*_}
echo $trim_left
trim_right=${trim_left%%</*}
echo $trim_right

echo https://releases.hashicorp.com/terraform/${trim_right}/terraform_${trim_right}_linux_amd64.zip
curl https://releases.hashicorp.com/terraform/${trim_right}/terraform_${trim_right}_linux_amd64.zip -o terraform_${trim_right}_linux_amd64.zip
apt update && apt install -y unzip
unzip terraform_${trim_right}_linux_amd64.zip
mv terraform{,_$trim_right}
mv terraform_$trim_right /usr/local/bin/
if [[ -h /usr/local/bin/terraform ]]; then rm /usr/local/bin/terraform; fi
ln -s /usr/local/bin/terraform_$trim_right /usr/local/bin/terraform
terraform -v
