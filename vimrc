"-----Vim Config-----

" General
filetype plugin on
filetype indent on
set path+=**
set wildmenu
set autoindent
set smartindent
set incsearch
set hlsearch
set ignorecase
set smartcase
set undofile
set undodir=~/.vim/undo
set history=1000
set scrolloff=10
set tags=./tags;,tags;

" Disabled
set nocompatible
set noswapfile
set nobackup
set nowrap
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

" Lang Specific Indentation (Langs added as I use them)
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType ino setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType sh setlocal tabstop=8 softtabstop=8 shiftwidth=8 expandtab

" Plugins
call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()

" Remaps
let g:mapleader = " "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fF :Files ~/<CR>
nnoremap <leader>fw :RG <CR>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Aesthetics
syntax on
colo default
hi Normal ctermfg=WHITE ctermbg=NONE
hi Search ctermfg=BLACK ctermbg=DARKYELLOW
