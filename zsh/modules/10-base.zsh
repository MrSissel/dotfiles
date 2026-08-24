# Base PATH and environment
# Loaded first — later modules may depend on these.

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# Python (user install)
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Visual Studio Code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Homebrew behaviour
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Volta (node version manager)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

# Local bin
# . "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

# Cargo (Rust) — env file unused, kept disabled
# . "$HOME/.cargo/env"

# Aliases
alias cli='/Applications/HBuilderX.app/Contents/MacOS/cli'
alias lg='lazygit'
