# fzf — fuzzy finder (rebinds Ctrl-R/Ctrl-T/Alt-C)
if command -q fzf
  fzf --fish | source
  set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"
  set -gx FZF_CTRL_T_OPTS "--preview '(bat --style=numbers --color=always {} 2>/dev/null || head -100 {}) | head -100'"
end
