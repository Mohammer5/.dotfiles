let g:fzf_buffers_jump = 1

nnoremap <silent> <Space><Space> :Buffers<enter>
nnoremap <silent> <Space>t :Ag<enter>
nnoremap <silent> <Space>f :Files<enter>

" plugins

vnoremap <leader>s "hy:Ag <C-r>h<Enter>
vnoremap <leader>S "hy:Agf <C-r>h<Enter>

" Make :Ag search content only and ignore file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Agf call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth ..2'}, <bang>0)

nnoremap <Space>s :call AgUnderCursor()<Enter>
nnoremap <Space>S :call AgfUnderCursor()<Enter>

fu! AgUnderCursor()
  let wordUnderCursor = expand("<cword>")

  if len(wordUnderCursor) > 0
    execute printf(':Ag %s', wordUnderCursor)
  else
    echo "No word under cursor"
  endif
endfu

fu! AgfUnderCursor()
  let wordUnderCursor = expand("<cword>")

  if len(wordUnderCursor) > 0
    execute printf(':Agf %s', wordUnderCursor)
  else
    echo "No word under cursor"
  endif
endfu
