#!/bin/sh
# macOS package bootstrap (Homebrew)

set -e

# One-time login-shell shim setup (idempotent, needs sudo).
# Runs FIRST so a brew failure below can't block it.
# Registers ~/.local/bin/login-shell as the login shell so every app's new
# sessions follow ~/.config/default-shell/current (see bin/default-fish).
# The shim is symlinked by etc/symlink.sh, which install.sh runs AFTER this
# script — so on a fresh machine this prints a hint and must be re-run.
SHIM="$HOME/.local/bin/login-shell"
if [ ! -x "$SHIM" ]; then
  echo "note: $SHIM not linked yet; re-run this script after etc/symlink.sh to finish login-shell setup"
elif [ "$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')" != "$SHIM" ]; then
  grep -qxF "$SHIM" /etc/shells || echo "$SHIM" | sudo tee -a /etc/shells
  chsh -s "$SHIM"
fi

brew install --cask font-maple-mono-nf-cn
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
brew install oh-my-posh
brew install mise
brew install fzf zoxide eza bat
brew install fish
