#!/bin/bash

# Update system
sudo dnf update -y

# Install individual packages
sudo dnf install -y git svn xsel gdb valgrind make strace gcc g++ obs-studio neofetch ibm-plex-fonts-all qemu nasm

# Install packages required to compile the Linux kernel
sudo dnf install -y ncurses-devel bc bison flex elfutils-libelf-devel openssl-devel dwarves

# Install Java 21 JDK
sudo dnf install -y java-21-openjdk-devel.x86_64

# Arduino CLI install via curl script
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
cd bin
sudo mv arduino-cli /usr/local/bin
cd ..
rm -r bin/
cd

# Clone the Linux Kernel repository
git clone https://github.com/torvalds/linux

# Configure git
git config --global user.name "Enter Name Here"
git config --global user.email "Enter Email Here"
git config --global core.editor vi
git config --global pull.rebase true  
git config --global init.defaultBranch main  
git config --global color.ui auto  

# Install Vim and set up .vimrc
sudo dnf install -y vim

# Create .vim directory and undo directory
cd
mkdir -p .vim/undo

# Replace default .vimrc with your custom vimrc
cat > ~/.vimrc << 'EOF'
" General Settings
set guicursor=
set mouse=
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undo
set ignorecase
set clipboard=unnamedplus

" Turn off filetype detection temporarily
filetype indent off
filetype plugin off

" Set terminal behavior
set t_ti=
set t_te=
let loaded_netrwPlugin = 1

" Formatting
set tabstop=8
set softtabstop=8
set shiftwidth=8
set scrolloff=8
set noexpandtab
set smartindent

" Clipboard Shortcuts
vnoremap <silent> <C-y> :w !xsel -ib<CR><Esc>
nnoremap <silent> <C-y> :"+y<CR>:call system('xsel -ib', getreg('"'))<CR>
inoremap <C-p> <C-r>=system('xsel -ob')<CR>
EOF

# Create .tmux.conf with custom settings
cat > ~/.tmux.conf << 'EOF'

set-option -g mouse off
set-option -g renumber-windows on
bind c new-window -c '#{pane_current_path}'
set-option -sg escape-time 10
set-option -g mode-keys vi
set-option -g set-clipboard on
set-option -g status-bg darkblue
set-option -g status-fg white
EOF

# Reload bash configuration (apply .bashrc changes)
source ~/.bashrc

# Print success message
echo "All requested packages and configurations have been installed!"

