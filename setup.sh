#!/bin/bash

source /etc/os-release
DOTFILES_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [[ "$ID" == "arch" ]]; then
  echo "Detected Arch Linux"
  echo "install packages"

  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm \
    atuin \
    git \
    base-devel \
    zsh \
    ghostty \
    tmux \
    neovim \
    python-pip \
    python-neovim \
    ripgrep \
    fd \
    fzf \
    bat \
    lsd \
    lazygit \
    luarocks \
    texlive-bin \
    tree-sitter-cli \
    imagemagick \
    ghostscript \
    stow \
    starship
fi

if [[ ! -d "$HOME/.config/share/nerd-fonts" ]]; then
  echo "Installing Nerd Fonts"
  mkdir -p "$HOME/.config/share/"
  git clone --depth 1 git@github.com:ryanoasis/nerd-fonts ~/.local/share/nerd-fonts
fi

echo "Installing Fira Code Nerd Font"
~/.local/share/nerd-fonts/install.sh FiraCode

ln -s "$DOTFILES_DIR/zshenv" "$HOME/.zshenv"
pushd "$DOTFILES_DIR" >/dev/null 2>&1 || true
stow .
popd >/dev/null 2>&1 || true
