# eza — modern ls replacement (icons need Nerd Font)
#
# 别名:
#   ls   目录优先排序 + 图标
#   ll   长格式 + git 状态列
#   la   长格式 + 隐藏文件 + git 状态
#   lt   两层树状视图
if (( ${+commands[eza]} )); then
  alias ls='eza --group-directories-first --icons=auto'
  alias ll='eza -l --group-directories-first --icons=auto --git'
  alias la='eza -la --group-directories-first --icons=auto --git'
  alias lt='eza --tree --level=2 --icons=auto'
fi
