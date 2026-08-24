# bat — modern cat replacement
#
# 用法:
#   cat 文件             带高亮 (alias 已接管, 管道安全)
#   bat 文件             完整带行号
#   bat --range 10:50 文件  只看区间
#   bat -A 文件          显示不可见字符
if (( ${+commands[bat]} )); then
  export BAT_THEME="TwoDark"
  alias cat='bat -pp'
fi
