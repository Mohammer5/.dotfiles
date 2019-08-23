set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor|dist'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }
let g:ctrlp_max_files=0

function! BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function! BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction
