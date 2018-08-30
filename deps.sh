#!/usr/bin/env bash

sudo pacman -Sy --noconfirm ruby unzip

curl https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip?_ga=2.132289742.137580065.1516108604-1353905029.1512772481 -o terraform.zip

sudo unzip terraform.zip -d /usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform

sudo pacman -Sy --noconfirm docker
sudo usermod -aG docker d33p
sudo systemctl enable docker
sudo systemctl start docker
