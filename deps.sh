#!/usr/bin/env bash

alias sp="sudo pacman -Sy --noconfirm"

sp go ruby unzip neovim

# Neo + Space Vim
ln "$CWD/vimrc" "$HOME/.vimrc"
curl -sLf https://spacevim.org/install.sh | bash

### Golang
mkdir -p ${}/{src,pkg,bin}

### Rust
curl https://sh.rustup.rs -sSf | sh

### Terraform
curl https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_linux_amd64.zip?_ga=2.132289742.137580065.1516108604-1353905029.1512772481 -o terraform.zip

sudo unzip terraform.zip -d /usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform

### Docker
sp docker
sudo usermod -aG docker d33p
sudo systemctl enable docker
sudo systemctl start docker

### gcloud
curl https://sdk.cloud.google.com | bash
gcloud init

### kubectl
gcloud components install kubectl

### helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

### yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay

### exa
cargo install exa

### bat
sp -S bat
