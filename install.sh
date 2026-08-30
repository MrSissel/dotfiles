#!/bin/zsh

# Dotfiles Bootstrap Installer — thin dispatcher

set -e

DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/MrSissel/dotfiles.git"

echo "==> Cloning dotfiles..."
if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$REPO_URL" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
else
    echo "Dotfiles already exists, pulling latest..."
    cd "$DOTFILES_DIR"
    git pull
fi

# Order matters on a fresh machine:
#   1. symlink first — bootstrap's login-shell step needs ~/.local/bin/login-shell,
#      which symlink.sh creates. (mise isn't installed yet, so symlink.sh skips it.)
#   2. bootstrap — Homebrew packages + login-shell shim (now present).
#   3. symlink again — idempotent; second pass runs `mise trust` + `mise install`
#      now that mise exists.
echo "==> Linking dotfiles..."
sh "$DOTFILES_DIR/etc/symlink.sh"
if [ "$(uname -s)" = "Darwin" ]; then
    sh "$DOTFILES_DIR/etc/symlink-macos.sh"
fi

echo "==> Installing packages..."
if [ "$(uname -s)" = "Darwin" ]; then
    sh "$DOTFILES_DIR/etc/bootstrap-macos.sh"
fi

echo "==> Installing mise tools..."
sh "$DOTFILES_DIR/etc/symlink.sh"

echo "==> Installing .omp (oh-my-pi harness)..."
if [ ! -d "$HOME/.omp" ]; then
    git clone https://github.com/MrSissel/myomp.git "$HOME/.omp"
fi
(cd "$HOME/.omp" && zsh install.sh)

echo "==> All done! Restart your terminal or source ~/.zshrc"
