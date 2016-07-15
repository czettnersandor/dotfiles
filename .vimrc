call pathogen#infect()
filetype off
syntax on
filetype plugin indent on
set nobackup

" let g:molokai_original = 1
" set t_Co=256
" colorscheme molokai

" keyboard mappings
map <C-n> :NERDTreeToggle<CR>

" quit vim if the only window left is NERTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set number
set showmatch
