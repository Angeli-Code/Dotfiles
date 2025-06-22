"
" Vim Config File
"

" General
filetype plugin on
set incsearch
set hlsearch
set path+=**
set wildmenu
set tags+=./tags;,tags
set colorcolumn=80
set scrolloff=10
set smartcase
set ignorecase
set clipboard=unnamedplus

" Backups and Undofile
set backupdir=~/.vim/backup/
set directory=~/.vim/swaps/
set undodir=~/.vim/undo/
set undofile
set backup
set swapfile
set history=1000

" Disabled Settings
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
set noexpandtab
set noerrorbells
set noswapfile
set nocompatible

" TODO: Language Specific Indentation Rules

" Fuzzy Finding
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Remaps
let mapleader = " "
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fF :FZF ~<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <C-d> <C-d>zz
vnoremap <silent> <C-y> :w !xsel -ib<CR><Esc>
nnoremap <silent> <C-y> :"+y<CR>:call system('xsel-ib', getreg('"'))<CR>

" Appearance
syntax off
colorscheme default
hi Normal ctermfg=WHITE ctermbg=NONE
hi Search ctermfg=BLACK ctermbg=WHITE
hi ColorColumn ctermbg=BLACK
hi LineNr ctermfg=DARKGREY
hi NonText ctermfg=WHITE
