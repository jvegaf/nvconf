augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
" au BufWinEnter <buffer> ++once :silent vertical resize 80<CR>
