#!/bin/sh

set -xe

### zsh ###
sudo pacman -Sy zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ${HOME}/.*zsh*
ln "./zshrc" "$HOME/.zshrc"

./deps.sh

#rm -rf "$HOME/.config/awesome" "$HOME/.vimrc" "$HOME/.vim"
#if ! test -d "$HOME/.config"; then
#  mkdir "$HOME/.config" 2>/dev/null
#fi

# ln -s "$CWD/config/awesome" "$HOME/.config/"

### vim
#mkdir -p "$HOME/.vim/colors"
#
#
#wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P "$HOME/.vim/colors"
#
#git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
#
#### installing vim plugins may take long time
#vim +PluginInstall +qall

