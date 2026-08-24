# zoxide — smart directory jump
#
# 用法:
#   z foo        跳到匹配度最高的常去目录
#   z foo bar    多关键词 AND 匹配
#   z            回 $HOME
#   zi           交互模式 (fzf 列候选)
#   zoxide query --list   查看数据库
(( ${+commands[zoxide]} )) && eval "$(zoxide init zsh)"
