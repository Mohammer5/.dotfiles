" Deoplete
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" YCM
  set completeopt-=preview

" " NerdTree
  let NERDTreeShowHidden=1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeNodeDelimiter = "\u00a0"
 
  " Open NERDTree
  nnoremap <C-n> :NERDTreeToggle<CR>
  nnoremap <Space>ntf :NERDTreeFind<CR>
 
  "open a nerdtree when vim starts
  " autocmd vimenter * call s:CheckToOpenNERDTree()
 
  function! s:CheckToOpenNERDTree() abort
    "don't open nerdtree for gitcommits
    if &ft == 'gitcommit' || &ft == 'gitrebase'
      return
    endif
 
    NERDTree
  endfunction

" ChadTree
  " nnoremap <C-n> <cmd>CHADopen<cr>
  " " let g:chadtree_settings = {'keymap': { 'primary': ["o"]                                                              }}
  " let g:chadtree_settings = {
  "   \'keymap': {
  "     \'quit': ["q"],
  "     \'toggle_version_control': [",g"],
  "     \'toggle_follow': [],
  "     \'toggle_hidden': ["."],
  "     \'refocus': ["~"],
  "     \'refresh': ["<c-r>"],
  "     \'change_focus': ["c"],
  "     \'change_focus_up': ["C"],
  "     \'open_sys': ["<enter>"],
  "     \'collapse': ["x"],
  "     \'copy': ["mc"],
  "     \'cut': ["mx"],
  "     \'delete': ["md"],
  "     \'new': ["ma"],
  "     \'rename': ["mr"],
  "     \'select': ["<space>"],
  "     \'clear_selection': ["<esc>"],
  "     \'primary': ["o"],
  "     \'h_split': ["i"],
  "     \'v_split': ["s"],
  "     \'secondary': ["g"],
  "     \'tertiary': [],
  "     \'clear_filter': ["F", "E"],
  "     \'filter': ["f"],
  "     \'search': ["e"],
  "     \'stat': ["K"],
  "     \'copy_name': ["y"],
  "     \'jump_to_current': ["J"],
  "     \'trash': ["t"],
  "     \'bigger': ["+", "="],
  "     \'smaller': ["-", "_"],
  "   \}
  " \}
  " " nnoremap o <cmd>CHADprimary<cr>
  " augroup ChadTreeLineNumbers
  "   autocmd!
  "   autocmd FileType CHADTree setlocal number
  "   autocmd BufEnter,FocusGained,InsertLeave,WinEnter,FileType CHADTree setlocal relativenumber
  " augroup END

  " function! CHADTest()
  "   let bufferz = getbufinfo({'bufloaded': 1})
  "   let result = []

  "   for l:item in bufferz
  "     "if empty(l:item.name)
  "     "  continue
  "     "endif
  "     call add(result, l:item)
  "   endfor

  "   echo result
  " endfunction
  " :command! Test call CHADTest()

  "nnoremap <leader>b messages
  "nnoremap <leader>b call CHADTest()<CR>

" fzf
  let g:fzf_buffers_jump = 1

  nnoremap <silent> <Space><Space> :Buffers<enter>
  nnoremap <silent> <Space>t :Ag<enter>
  nnoremap <silent> <Space>T :Agf<enter>
  nnoremap <silent> <Space>f :Files<enter>

  " Make :Ag search content only and ignore file names
  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  command! -bang -nargs=* Agf call fzf#vim#ag(<q-args>, {}, <bang>0)

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

" Airline
  " let g:airline_theme='term'
  " let g:airline#extensions#tabline#enabled = 1
  " let g:airline#extensions#tabline#buffer_nr_show = 1
  " let g:airline#extensions#branch#enabled = 0
  " let g:airline#extensions#tabline#fnamemod = ':t'
  " let g:airline_powerline_fonts = 1

" indentLine
  let g:indentLine_char_list = ['2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

" ultisnips
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<c-space>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

" ale
  let g:ale_fixers = {}
  let g:ale_fixers.javascript = ['eslint']
  let g:ale_fix_on_save = 1

" prettier
  let g:prettier#autoformat = 0
  let g:prettier#config#single_quote = 'true'
  let g:prettier#config#config_precedence = 'file-override'
