# bat — modern cat replacement
if command -q bat
  set -gx BAT_THEME TwoDark
  alias cat 'bat -pp'
end
