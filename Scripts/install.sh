#!/bin/bash
# fedora i3 Configuration

# General Package Installation
sudo dnf update -y
sudo dnf install -y git svn xsel gdb valgrind make gcc g++ neofetch qemu nasm java-21-openjdk-devel.x86_64
sudo dnf install -y tmux ncurses-devel bc bison flex openssl-devel dwarves elfutils-libelf-devel
sudo dnf install -y alacritty cscope ctags polybar brightnessctl vim obs-studio

# Arduino-CLI 
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
cd bin/
sudo mv arduino-cli /usr/local/bin
cd ..
rm -r bin/
sudo usermod -aG dialout $USER
arduino-cli config init
arduino-cli config dump
arduino-cli core install arduino:avr
arduino-cli core update-index
arduino-cli core upgrade

# Linux Kernel Cloning,Compiling,and Ctags generation
cd
git clone https://github.com/torvalds/linux
cd linux
make defconfig
make -j$(nproc)
cd
mv ~/linux/ ~/Programming
cd ~/Programming/linux/
ctags -R .

# Git configuration
git config --global user.name "Enter name here"
git config --global user.email "Enter email here"
git config --global core.editor vi
git config --global pull.rebase true  
git config --global init.defaultBranch main  
git config --global color.ui auto

# Move Files into Correct Locations
mkdir -p ~/.config/alacritty/
mkdir -p ~/.config/polybar/
mkdir -p ~/.vim/
mkdir -p ~/.vim/undo/
cp ~/Programming/Dotfiles/Config-Files/vimrc ~/.vimrc
cp ~/Programming/Dotfiles/Config-Files/tmux.conf ~/.tmux.conf
cp ~/Programming/Dotfiles/Config-Files/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/Programming/Dotfiles/Config-Files/config.ini ~/.config/polybar/config.ini
cp ~/Programming/Dotfiles/Config-Files/config ~/.config/i3/config
cp ~/Programming/Dotfiles/Config-Files/bashrc ~/.bashrc
sudo cp ~/Programming/Dotfiles/Config-Files/touchscreen.conf /etc/X11/xorg.conf.d/touchscreen.conf

# Wallpaper 
mv ~/Programming/Dotfiles/wallpaper.jpg ~/Pictures/wallpaper.jpg

# Clean up
sudo dnf remove i3-sensible-terminal
sudo dnf autoremove -y
sudo dnf clean all
