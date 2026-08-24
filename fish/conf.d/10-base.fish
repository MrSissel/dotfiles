# Base PATH and environment (login-shell fish)
# Nested fish inherits from zsh; this covers fish-as-login-shell.

set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
set -gx VOLTA_HOME "$HOME/.volta"
set -gx VOLTA_FEATURE_PNPM 1

fish_add_path /opt/homebrew/bin
fish_add_path "$HOME/Library/Python/3.9/bin"
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fish_add_path "$VOLTA_HOME/bin"
fish_add_path "$HOME/.local/bin"

alias cli '/Applications/HBuilderX.app/Contents/MacOS/cli'
alias lg 'lazygit'
