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
set listchars=tab:⟶\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:$
set scrolloff=8
set sidescrolloff=8
set clipboard=unnamed
set signcolumn=yes
set updatetime=500
set confirm
set autoindent
set showmatch
set matchtime=2
set matchpairs=(:),\[:\],{:},<:>
set laststatus=2
set undofile
set undodir=~/.vim/undodir
set autoread
set virtualedit=block
set relativenumber

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
nnoremap <silent> <Leader>nr :call NumberToggle()<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gf :Git fetch<CR>
nnoremap <leader>gpu :Git pull<CR>
nnoremap <leader>gr :Git rbi<CR>
nnoremap <leader>gm :Gvdiffsplit!<CR>
nnoremap <leader>gfp :Git fpush<CR>
nnoremap <leader>g2 :diffget //2<CR>
nnoremap <leader>g3 :diffget //3<CR>
nnoremap <C-S-X> :term<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap U <C-r>
nnoremap Y y$

nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nnoremap <leader>N :NERDTreeFind<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-@> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 highlight ExtraWhitespace guibg=lightgray ctermfg=242 ctermbg=236
 highlight NonText ctermfg=242 ctermbg=236
 highlight SpecialKey ctermfg=242 ctermbg=236
 match ExtraWhitespace /\s\+$/
 
" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>
