#!/bin/bash

fish-shell_install () {
  if [ ! -f /usr/bin/fish ]
  then
    sudo pacman -Sy fish
  fi
  cp -r ./.config/fish ~/.config/fish/
  fisher install ilancosman/tide@v5 || curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher && fisher install ilancosman/tide@v5
  fisher install jethrokuan/z
  fisher install zzhaolei/transient.fish

  sudo pacman -S exa ghq fzf
}

neovim_install () {
  cp -r ./.config/nvim/ ~/.config/
}

tmux_install () {
  cp -r ./.config/tmux/ ~/.config/
}

if [[ $1 -eq "fish" ]]; then
  fish_install()
elif [[ $1 -eq "nvim" ]]; then
  neovim_install()
elif [[ $1 -eq "tmux" ]]; then
  tmux_install()
else
  fish_install()
  neovim_install()
  tmux_install()
fi
