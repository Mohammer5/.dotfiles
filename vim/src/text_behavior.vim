" Text behavior {{{
" ========================================================
" ========================================================
" ========================================================

  augroup TextWrapMarkdown
    autocmd!
    autocmd Syntax markdown setlocal wrap linebreak nolist
    autocmd Syntax markdown setlocal tw=79 fo+=t
  augroup END

" }}}
