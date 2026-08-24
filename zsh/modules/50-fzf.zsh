# fzf — fuzzy finder (rebinds Ctrl-R/Ctrl-T/Alt-C)
#
# 用法:
#   Ctrl-R    模糊搜历史命令
#   Ctrl-T    模糊选当前目录文件, 回车插入路径
#   Alt-C     模糊选子目录并 cd 过去
#   管道:     任意列表 | fzf, 如 ls | fzf
if (( ${+commands[fzf]} )); then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
  export FZF_CTRL_T_OPTS="--preview '(bat --style=numbers --color=always {} 2>/dev/null || head -100 {}) | head -100'"
fi
