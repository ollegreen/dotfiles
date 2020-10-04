syntax enable
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set relativenumber
set hlsearch
set ruler
set paste
highlight Comment cterm=italic gui=italic
highlight Comment ctermfg=blue
execute pathogen#infect()
filetype plugin indent on
