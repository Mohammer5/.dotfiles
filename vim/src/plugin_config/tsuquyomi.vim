" Tsuquyomi settings
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 0
let g:tsuquyomi_shortest_import_path = 1

" enable tooltip for symbol under cursor
autocmd FileType typescript nnoremap <buffer> <space>t : <C-u>echo tsuquyomi#hint()<CR>

" reload buffer of new files
augroup reload_tsu_buffer
  autocmd!
  autocmd BufLeave *.ts TsuReload
  autocmd BufLeave *.tsx TsuReload
augroup END

command! ResetTsu execute "TsuquyomiStopServer" | execute "TsuquyomiStartServer" | execute "TsuquyomiOpen"
augroup tsuquyomi_reset
	au!
	au BufEnter,WinEnter,WinNew typescript execute "ResetTsu"
augroup END
