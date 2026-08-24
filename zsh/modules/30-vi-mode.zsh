# Vi mode with cursor shape feedback
# Must load BEFORE zsh plugins (syntax-highlighting wraps widgets).

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
