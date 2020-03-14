source ~/.bashrc

fish_vi_key_bindings


function reverse_history_search
  history | fzf --no-sort --height 30 | read -l command
  if test $command
    commandline -rb $command
  end
end

function fish_user_key_bindings
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
  bind -M default / reverse_history_search
  bind -M insert \cr reverse_history_search
  bind -M insert \cp history-search-backward
  bind -M insert \cn history-search-forward
end
