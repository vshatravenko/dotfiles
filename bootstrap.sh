#!/usr/bin/env bash

set -e

target_user=${1:-d33p}

function sp() {
  sudo pacman -Sy --noconfirm "$@"
}

function install_yay () {
  git clone https://aur.archlinux.org/yay.git
  cd yay || return
  makepkg -si
  cd .. && rm -rf yay
}

function init_nvim () {
  nvim_src="config/nvim-conf"
  nvim_home="${HOME}/.config/nvim"
  mkdir -p "${nvim_home}"
  ln "${nvim_src}" "${nvim_home}"
}

# Configure parallelism for pacman
sudo sed -i "s/\# ParallelDownloads.*/ParallelDownloads = $(nproc)/" /etc/pacman.conf

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf "${HOME}"/.*zsh*
ln "./zshrc" "$HOME/.zshrc"

sp zsh go ruby unzip neovim terraform ansible ripgrep bat zsh

# NeoVim setup
init_nvim

# Required dirs for Golang
mkdir -p "${HOME}"/{src,pkg,bin}

# Rust
curl https://sh.rustup.rs -sSf | sh

# Docker
sp docker
sudo usermod -aG docker "${target_user}"
sudo systemctl start docker
sudo systemctl enable docker

# gcloud
curl https://sdk.cloud.google.com | bash
gcloud init

# kubectl
gcloud components install kubectl

# helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# yay
install_yay || echo "error: yay could not be installed"

# exa
cargo install exa
