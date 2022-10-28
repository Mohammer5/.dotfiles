" Folding {{{
" ========================================================
" ========================================================
" ========================================================

  augroup Foldmethod
    autocmd!
    autocmd Syntax vim setlocal foldmethod=marker
    autocmd Syntax markdown setlocal foldmethod=marker
    autocmd Syntax scss.css setlocal foldmethod=indent
    "autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal foldmethod=indent
  augroup END

  augroup Foldbehavior
    autocmd!
    autocmd Syntax scss.css setlocal nofoldenable " use `zi` to toggle
    "autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal nofoldenable " use `zi` to toggle
  augroup END

  augroup FoldJS
    autocmd!
    autocmd Syntax javascript,jsx,javascript.jsx,javascriptreact,typescript setlocal foldmethod=syntax
    autocmd Syntax javascript,jsx,javascript.jsx,javascriptreact,typescript setlocal foldcolumn=1 "defines 1 col at window left, to indicate folding
  augroup END
" }}}
