# Zsh config — thin loader.
# Modules live in ~/.dotfiles/zsh/modules/, loaded in numbered order.

for f in "$HOME/.dotfiles/zsh/modules/"*.zsh(N); do
  source "$f"
done

# Machine-local overrides (never committed) — must stay last.
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
