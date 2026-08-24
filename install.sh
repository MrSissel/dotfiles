#!/bin/zsh

# Dotfiles Bootstrap Installer — thin dispatcher

set -e

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="git@github.com:MrSissel/dotfiles.git"

echo "==> Cloning dotfiles..."
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
else
    echo "Dotfiles already exists, pulling latest..."
    cd "$DOTFILES_DIR"
    git pull
fi

echo "==> Installing packages..."
if [ "$(uname -s)" = "Darwin" ]; then
    sh "$DOTFILES_DIR/etc/bootstrap-macos.sh"
fi

echo "==> Linking dotfiles..."
sh "$DOTFILES_DIR/etc/symlink.sh"
if [ "$(uname -s)" = "Darwin" ]; then
    sh "$DOTFILES_DIR/etc/symlink-macos.sh"
fi

echo ""
echo "==> Next: git clone git@github.com:MrSissel/myomp.git ~/.omp && ~/.omp/install.sh"
echo "==> All done! Restart your terminal or source ~/.zshrc"
