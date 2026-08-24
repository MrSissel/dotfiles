#!/bin/zsh

# Dotfiles Bootstrap Installer

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

echo "==> Installing Homebrew packages..."
# Fonts
brew install --cask font-maple-mono-nf-cn

# Zsh plugins
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search

# Oh My Posh
brew install oh-my-posh

echo "==> Linking dotfiles..."
# zsh
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# git
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"

# kitty
mkdir -p "$HOME/.config/kitty"
ln -sf "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# tmux
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# oh-my-posh
ln -sf "$DOTFILES_DIR/oh-my-posh/catppuccin_macchiato.omp.json" "$HOME/.catppuccin_macchiato.omp.json"

# aerospace
ln -sf "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"

echo ""
echo "==> All done! Restart your terminal or source ~/.zshrc"
