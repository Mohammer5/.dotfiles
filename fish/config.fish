# source ~/.bashrc

# set -gx PATH /snap/bin $PATH
# set -gx PATH (yarn global bin) $PATH
# set -gx PATH /usr/local/ant/bin $PATH

fish_vi_key_bindings
set -g theme_color_scheme zenburn

function reverse_history_search
  history | fzf --no-sort --height 30 | read -l command
  test $command && commandline -rb $command
end

function fish_user_key_bindings
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
  bind -M default / reverse_history_search
  bind -M insert \cr reverse_history_search
  bind -M insert \cp history-search-backward
  bind -M insert \cn history-search-forward
  bind -M insert \cl accept-autosuggestion execute
end

# any-nix-shell fish --info-right | source

source /home/gerkules/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
