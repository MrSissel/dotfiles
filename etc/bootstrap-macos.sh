#!/bin/sh
# macOS package bootstrap (Homebrew)

set -e

brew install --cask font-maple-mono-nf-cn
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
brew install oh-my-posh
brew install mise
brew install fzf zoxide eza bat
