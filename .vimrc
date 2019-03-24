" All custom Vim Vundle plugin is here, refer to
" https://github.com/VundleVim/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Fix status bar in Terminator and Tmux
set t_Co=256

" Vundle plugin
Plugin 'VundleVim/Vundle.vim'
" Nerdtree for file viewer
Plugin 'scrooloose/nerdtree'
" Extra stuff on status bar with theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Search
Plugin 'Shougo/unite.vim'
" Code format <F3>.
" First install formatters sudo apt install astyle, pandoc, tidy.
" sudo pip install jsbeautifier
Plugin 'sbdchd/neoformat'
" Java autocomplete (Not working yet)
" Plugin 'artur-shaik/vim-javacomplete2'
" Tab for Nerdtree
Plugin 'ervandew/supertab'
" Python autocomplete :help jedi-vim
Plugin 'davidhalter/jedi-vim'
" Checks for synatx error in code, any lang supported
Plugin 'scrooloose/syntastic' 
" Makrdown syntax highlighter
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'Valloric/YouCompleteMe'

" For git branch on status bar
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete  " autocompletion for CSS files `Ctrl + x + Ctrl + o`
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags " autocompletion for HTML files `Ctrl + x + Ctrl + o`
" End of Vundle

syntax on
set number
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
set complete+=kspell
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" related to eclim plugin
set nocompatible
set mouse=a
set ttymouse=xterm
map <F6> :setlocal spell spelllang=en_us<CR>
"system-wide copy/paster (F9)/(F10) - prior to that install sudo apt install vim-gtk
"Ctrl + c and Ctrl + v is removed because they tamper comment and uncomment of
"the code. 
"To comment Ctrl + V first chars of lines and then Shift + I
"To uncomment Ctrl + V then press x
nnoremap <F9> "+y 
vnoremap <F9> "+y 
" Capital P to paste before cursor
nnoremap <F10> "+P 
vnoremap <F10> "+P

"insert a line without going to insert mode, Enter --> next line, Shift + enter
"--> previous line
nmap <C-Enter> O<Esc>
nmap [<Space> O<Esc>
nmap <CR> o<Esc>
" disable folding in .md files caused by Markdown plugin
let g:vim_markdown_folding_disabled = 1

" enable powerline font, to show arrow in status bar properly
" need to install poweline-font sudo apt-get install fonts-powerline
let g:airline_powerline_fonts = 1

" NerdTREE
" Disable NerdTree on start up to speed up the load time and save one key
" stroke :-P
"autocmd Vimenter * NERDTree
autocmd VimEnter * wincmd p
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neoformat
map <F3> :Neoformat<CR>

" Javacomplete2
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" nmap <F5> <Plug>(JavaComplete-Imports-Add)
" imap <F5> <Plug>(JavaComplete-Imports-Add)
" nmap <F7> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F7> <Plug>(JavaComplete-Imports-AddMissing)
" nmap <F8> <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <F8> <Plug>(JavaComplete-Imports-RemoveUnused)
" nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
" nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
" nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
" nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
" imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
" imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
" imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
" imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
" nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)
" imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)
" nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
" nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
" nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
" nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
" nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
" 
" imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
" imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
" imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" 
" vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
" vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
" vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" 
" nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
" nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)
