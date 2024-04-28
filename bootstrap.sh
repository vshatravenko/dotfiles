#!/usr/bin/env bash

set -ex

target_user=${1:-d33p}
github_user=${2:-vshatravenko}
github_email=${3:-"vshatravenko@gmail.com"}
github_name=${3:-"Valentine Shatravenko"}

function sp() {
  sudo pacman -Sy --noconfirm "$@"
}

function install_ohmyzsh() {
  rm -rf /home/${target_user}/.oh-my-zsh
  cd /home/${target_user}
  sudo -u d33p CHSH=yes RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cd -
  rm -rf "/home/${target_user}"/.zsh*
  ln "./config/zshrc" "/home/${target_user}/.zshrc"
}

function init_nvim () {
  nvim_src="config/nvim-conf"
  nvim_home="/home/${target_user}/.config/nvim"
  mkdir -p "$(dirname ${nvim_home})"
  ln -s "${nvim_src}" "${nvim_home}" || echo "Could not link the new NeoVim config"
}

function init_gcloud () {
  rm -rf /home/${target_user}/google-cloud-sdk
  curl https://sdk.cloud.google.com | sudo -u ${target_user} CLOUDSDK_CORE_DISABLE_PROMPTS=1 bash
  sudo -u ${target_user} zsh -c "source /home/${target_user}/google-cloud-sdk/path.zsh.inc && gcloud init" || echo "Error encountered during init"
}

function init_git () {
sudo -u ${target_user} sh <<EOF
git config --global user.name "${github_name}"
git config --global user.email "${github_email}"
EOF
}

# sudo setup
echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
usermod -aG wheel ${target_user}

# Configure parallelism and colors for pacman
sed -i "s/\# ParallelDownloads.*/ParallelDownloads = $(nproc)/" /etc/pacman.conf
sed -i '/Color/s/^#//g' /etc/pacman.conf

sp yay git zsh go ruby unzip neovim terraform ansible ripgrep bat zsh rust kubectl helm

# Oh My ZSH
install_ohmyzsh

# NeoVim setup
init_nvim

# Required dirs for Golang
mkdir -p "${HOME}"/{src,pkg,bin}

# Docker
sp docker
usermod -aG docker "${target_user}"
systemctl start docker
systemctl enable docker

# gcloud
init_gcloud

# exa
sudo -u ${target_user} zsh -c "source ~/.zshrc && cargo install exa"

# SSH access setup
mkdir /home/${target_user}/.ssh
curl https://github.com/${github_user}.keys >> /home/${target_user}/.ssh/authorized_keys

# Git
init_git
