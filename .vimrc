set number
autocmd BufRead,BufNewFile *.txt setlocal spell
set complete+=kspell
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" related to eclim plugin
set nocompatible
filetype plugin indent on

