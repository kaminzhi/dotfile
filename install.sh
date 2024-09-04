#!/bin/bash

# Function to install Fish shell and related plugins
fish_shell_install() {
  if ! command -v fish &>/dev/null; then
    echo "Installing Fish shell..."
    sudo pacman -Sy --noconfirm fish
  else
    echo "Fish shell is already installed."
  fi

  echo "Copying Fish configuration..."
  mkdir -p ~/.config/fish
  cp -r ./.config/fish/* ~/.config/fish/

  echo "Installing Fisher and plugins..."
  fish -c "
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
        fisher install ilancosman/tide@v5
        fisher install jethrokuan/z
        fisher install zzhaolei/transient.fish
    "

  echo "Installing additional tools..."
  sudo pacman -S --noconfirm exa ghq fzf
}

# Function to install Neovim configuration
neovim_install() {
  echo "Copying Neovim configuration..."
  mkdir -p ~/.config/nvim
  cp -r ./.config/nvim/* ~/.config/nvim/
}

# Function to install Tmux configuration
tmux_install() {
  echo "Copying Tmux configuration..."
  mkdir -p ~/.config/tmux
  cp -r ./.config/tmux/* ~/.config/tmux/
}

# Main installation logic
main() {
  case "$1" in
  fish)
    fish_shell_install
    ;;
  nvim)
    neovim_install
    ;;
  tmux)
    tmux_install
    ;;
  *)
    echo "Installing all components..."
    fish_shell_install
    neovim_install
    tmux_install
    ;;
  esac
}

# Run the main function
main "$1"
