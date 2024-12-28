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
set hidden
let mapleader=" "
set ff=unix
set shiftwidth=4
set tabstop=4
set list
set listchars=tab:⟶\ ,extends:›,precedes:‹,nbsp:·,trail:·
set scrolloff=8
set sidescrolloff=8
set clipboard=unnamed
et signcolumn=yes
set updatetime=500

syntax on

map Q gq
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>d :put =strftime('%F')<CR>
map <leader>c y"*
map <leader>v p"*
map <leader>V P"*
map <leader>f :Files<CR>
filetype off

" reselect after chaning indentation
vnoremap < <gv
vnoremap > >gv

" just replace visual selection without copying
vnoremap <leader>p "_dP

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn//fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
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
nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <C-S-X> :term<CR>

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nnoremap <leader>N :NERDTreeFind<CR>

 highlight ExtraWhitespace guibg=lightgray
 match ExtraWhitespace /\s\+$/
