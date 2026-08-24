#!/bin/sh
# macOS-only symlinks

set -e

DOTFILES_DIR="$HOME/.dotfiles"

link() {
  mkdir -p "$(dirname "$2")"
  ln -sf "$1" "$2"
}

link "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"
