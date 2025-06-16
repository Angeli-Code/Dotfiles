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

" Backups, Undofile, and Swaps
set directory=~/.vim/swaps
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set history=1000

" Disabled Settings
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
set noexpandtab
set noerrorbells
set nocompatible

" TODO: Language Specific Indentation Rules

" Fuzzy Finding
" TODO: Look for native solution for fuzzy finding
call plug#begin('~/.vim/plugged')
call plug#end()
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Remaps
let mapleader = " "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fw :Rg<CR>
nnoremap <C-d> <C-d>zz
vnoremap <silent> <C-y> :w !xsel -ib<CR><Esc>
nnoremap <silent> <C-y> :"+y<CR>:call system('xsel-ib', getreg('"'))<CR>

" Appearance **This has to come after "Fuzzy Finding" to override colors**
hi MatchParen ctermfg=WHITE ctermbg=DARKGREY
hi Search ctermfg=BLACK ctermbg=WHITE
hi ColorColumn ctermbg=BLACK
highlight ExtraWhitespace ctermbg=DARKRED
match ExtraWhitespace /\s\+$/
