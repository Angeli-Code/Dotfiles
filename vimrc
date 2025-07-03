"
" Vim Config File
"

" General
filetype plugin indent on
set path+=**
set wildmenu
set tags+=./tags;,tags
set scrolloff=0
set smartcase
set ignorecase

" Undo
set undodir=~/.vim/undo/
set undofile
set history=1000

" Disabled Settings
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
set noexpandtab
set noerrorbells
set noswapfile
set nocompatible
set noincsearch
set nohlsearch
set nobackup

" Language Specific Indentation Rules
autocmd FileType html,css,javascript,json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python, java, sh tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c,cpp,h setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

" Clipboard
set clipboard=unnamedplus
vnoremap <silent> <C-y> :w !wl-copy <CR><Esc>
nnoremap <silent> <C-y> :"+y<CR>:call system('wl-copy', getreg('"'))<CR>

" Minimal Appearance
syntax off
colorscheme default
hi Normal ctermfg=WHITE ctermbg=NONE
hi Search ctermfg=WHITE ctermbg=NONE
hi MatchParen ctermfg=WHITE ctermbg=NONE
hi LineNr ctermfg=WHITE
hi NonText ctermfg=WHITE
