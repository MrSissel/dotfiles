#!/bin/sh
# Shared dotfile symlinks + mise setup (all platforms)

set -e

DOTFILES_DIR="$HOME/.dotfiles"

link() {
  mkdir -p "$(dirname "$2")"
  ln -sf "$1" "$2"
}

link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES_DIR/oh-my-posh/.catppuccin_macchiato.omp.json" "$HOME/.catppuccin_macchiato.omp.json"
link "$DOTFILES_DIR/mise/config.toml" "$HOME/.config/mise/config.toml"

# mise setup (skip if mise not installed yet)
if command -v mise >/dev/null 2>&1; then
  mise trust "$DOTFILES_DIR/mise/config.toml"
  mise install
fi
