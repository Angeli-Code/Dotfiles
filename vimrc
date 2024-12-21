" Vi Improved Configuation File

filetype plugin indent on
set autoindent
set smartindent
set hlsearch
set noincsearch
set scrolloff=0
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
set noexpandtab
set nocompatible
set nowrap
set noswapfile
set nobackup
set tags+=./tags;,tags

syntax on
colorscheme default
highlight Normal ctermfg=WHITE ctermbg=NONE
highlight Search ctermfg=BLACK ctermbg=YELLOW
highlight MatchParen ctermfg=YELLOW ctermbg=NONE
highlight LineNr ctermfg=DARKGREY

set undofile
set undodir=~/.vim/undo
set history=2000

highlight ExtraWhitespace ctermbg=DARKRED
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e

set clipboard=unnamedplus
vnoremap <silent> <C-y> :w !wl-copy<CR><Esc>
nnoremap <silent> <C-y> :"+y<CR>:call system('wl-copy', getreg('"'))<CR>
nnoremap <C-d> <C-d>zz

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
set noincsearch
