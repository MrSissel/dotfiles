# eza — modern ls replacement (icons need Nerd Font)
if command -q eza
  alias ls 'eza --group-directories-first --icons=auto'
  alias ll 'eza -l --group-directories-first --icons=auto --git'
  alias la 'eza -la --group-directories-first --icons=auto --git'
  alias lt 'eza --tree --level=2 --icons=auto'
end
