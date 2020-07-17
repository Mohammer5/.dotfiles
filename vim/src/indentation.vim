" Indentation {{{
" ========================================================
" ========================================================
" ========================================================

  set autoindent
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=-1
  set nowrap

  " filetype specific rules
  autocmd Filetype sh setlocal ts=2 sw=2 expandtab smarttab
  autocmd Filetype html setlocal ts=2 sw=2 expandtab smarttab
  autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype jsx setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab smarttab

" }}}
