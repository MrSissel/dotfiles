# If you come from bash you might have to change your $PATH.
# BASE PATH setting
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

# Program Start
# python
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

#hbuilder cli
alias cli='/Applications/HBuilderX.app/Contents/MacOS/cli'

# lazy-git
alias lg='lazygit'

# ruby Path
# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Vscode Path
# export PATH=$PATH:/usr/local/bin/code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# fzf-zsh
# source <(fzf --zsh)

#clashx set
# export https_proxy=http://127.0.0.1:7890
# export http_proxy=http://127.0.0.1:7890
# export all_proxy=socks5://127.0.0.1:7890

# homebrew set
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# VOLTA setting
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.catppuccin_macchiato.omp.json)"

# cargo
. "$HOME/.cargo/env"

# vi mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q' # 方块光标，闪烁
  else
    echo -ne '\e[5 q' # 竖线光标，闪烁
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[5 q' # 插入模式默认使用闪烁竖线
}
zle -N zle-line-init

export KEYTIMEOUT=1
set -o vi
bindkey "^?" backward-delete-char

# export TERM=xterm-kitty

# zsh plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Program End

. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
