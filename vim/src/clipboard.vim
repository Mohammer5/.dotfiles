" Clipboard {{{
" ========================================================
" ========================================================
" ========================================================

  set clipboard=unnamed

  " paste to clipboard
  vnoremap <leader>y "+y
  nnoremap <leader>Y "+yg
  nnoremap <leader>y "+y

  " paste to clipboard
  nnoremap <leader>p "+p
  nnoremap <leader>P "+P
  vnoremap <leader>p "+p
  vnoremap <leader>P "+P

  " Paste newest buffer in input mode
  inoremap <silent> <C-v> <C-R>*

" }}}
