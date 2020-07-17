" File saving {{{
" ========================================================
" ========================================================
" ========================================================

  let g:auto_save = 0
  nnoremap <silent> <Enter> :w<CR>
  nnoremap <silent> <Space><Enter> :Prettier<CR>:w<CR>
  nnoremap <leader><C-s> :call ToggleAutoSave()<CR>

  function! ToggleAutoSave()
    if g:auto_save
      let g:auto_save = 0
    else
      let g:auto_save = 1
    endif
  endfunction

" }}}
