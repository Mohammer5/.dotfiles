" Cursor line & Line numbers {{{
" ========================================================
" ========================================================
" ========================================================

  "set cursorcolumn
  "set statusline+=%-10.3n\
  highlight LineNr ctermfg=white

  "* Cursor line {{{
    " Enable CursorLine
    " set cursorline

    " Default Colors for CursorLine
    highlight CursorLine ctermbg=None ctermfg=None

    " Change Color when entering Insert Mode
    autocmd InsertEnter * highlight  CursorLine ctermbg=Black ctermfg=None

    " Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None
  "}}}

  "* Line numbers {{{
    set number relativenumber
    nnoremap ln :setlocal relativenumber!<enter>
    augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
  "}}}

" }}}
