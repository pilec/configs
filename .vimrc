set number
set ignorecase
set ruler
set hlsearch
set incsearch
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set wildmenu
set display=truncate
set fileencoding=utf8
set undofile
let mapleader=" "
set ff=unix

syntax on

map Q gq
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>d :put =strftime('%F')<CR>
map <leader>c y"*
map <leader>v p"*
map <leader>V P"*
map <leader>f :Files<CR>
filetype off

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn//fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
call plug#end()

filetype plugin indent on
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
