call pathogen#infect()
filetype off
syntax on
filetype plugin indent on
set nobackup

" keyboard mappings
map <C-n> :NERDTreeToggle<CR>

" quit vim if the only window left is NERTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set number
set showmatch
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=terminus\ 14px
set expandtab
set shiftwidth=4
set tabstop=4
