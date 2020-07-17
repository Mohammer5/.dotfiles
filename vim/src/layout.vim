" Layout {{{
" ========================================================
" ========================================================
" ========================================================

  augroup resize_handling
  autocmd!
  autocmd VimResized * wincmd =
  augroup END

  " Window resizing
  nnoremap <silent> <Space>h 5<C-W><
  nnoremap <silent> <Space>l 5<C-W>>
  nnoremap <silent> <Space>j 5<C-W>+
  nnoremap <silent> <Space>k 5<C-W>-

  " Changing layout -> vertical/horizontal
  nnoremap <silent> <Space>lh <C-w>t<C-w>K<CR>
  nnoremap <silent> <Space>lv <C-w>t<C-w>H<CR>

" }}}
