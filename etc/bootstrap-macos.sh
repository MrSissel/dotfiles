#!/bin/sh
# macOS package bootstrap (Homebrew)

set -e

# One-time login-shell shim setup (idempotent, needs sudo).
# Registers ~/.local/bin/login-shell as the login shell so every app's new
# sessions follow ~/.config/default-shell/current (see bin/default-fish).
# install.sh runs symlink.sh BEFORE this script, so the shim exists here.
# If it doesn't, just re-run this script after symlink.sh.
SHIM="$HOME/.local/bin/login-shell"
if [ ! -x "$SHIM" ]; then
  echo "note: $SHIM not linked yet; re-run this script after etc/symlink.sh to finish login-shell setup"
elif [ "$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')" != "$SHIM" ]; then
  grep -qxF "$SHIM" /etc/shells || echo "$SHIM" | sudo tee -a /etc/shells
  chsh -s "$SHIM"
fi

brew install --cask font-maple-mono-nf-cn
brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
# --formula: the jandedobeler/oh-my-posh tap ships a same-named cask that
# can shadow the core formula (and trip brew's tap-trust) if that tap exists
brew install --formula oh-my-posh
brew install mise
brew install fzf zoxide eza bat
brew install fish

# Dev toolchain (formulas + casks)
brew install ruby tmux
brew install --cask kitty aerospace temurin@17

# kimi-code: standalone binary; PATH is handled by the local shell config
# (~/.zshrc.local / local.fish), so skip the installer's rc-file edits —
# they would write through the symlinked ~/.zshrc into the dotfiles repo.
curl -fsSL https://code.kimi.com/kimi-code/install.sh | KIMI_NO_MODIFY_PATH=1 bash
# SSH key for GitHub push (idempotent). HTTPS clone works without it; push
# needs the public key added once at https://github.com/settings/ssh/new
# Runs LAST so brew's logs can't scroll the key out of view; the key is
# also copied to the clipboard (pbcopy), which survives any scrolling.
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -N "" -f "$HOME/.ssh/id_ed25519"
  cat "$HOME/.ssh/id_ed25519.pub" | pbcopy
  echo "==> Public key copied to clipboard. Add it at: https://github.com/settings/ssh/new"
fi
