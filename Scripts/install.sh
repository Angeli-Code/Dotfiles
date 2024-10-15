#!/bin/bash

# General Package Installation
sudo dnf update -y
sudo dnf install -y git svn xsel gdb valgrind make gcc g++ neofetch qemu nasm
sudo dnf install -y kernel-devel kernel-headers ctags tmux java-21-openjdk-devel.x86_64 
sudo dnf install -y ncurses-devel bc bison flex elfutils-libelf-devel openssl-devel dwarves
sudo dnf install -y alacritty

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
arduino-cli core updgrade

# Linux Kernel
cd
git clone https://github.com/torvalds/linux
cd linux
make defconfig
make -j$(nproc)
cd
mv ~/linux/ ~/Programming
cd ~/Programming/linux/

# Configure Git
git config --global user.name "Enter Name Here"
git config --global user.email "Enter Email Here"
git config --global core.editor vi
git config --global pull.rebase true  
git config --global init.defaultBranch main  
git config --global color.ui auto 

# Move Files Into Correct Locations
mkdir ~/.config/alacritty/
mkdir ~/.vim/
mkdir ~/.vim/undo/
cp ~/Programming/Dotfiles/Config-Files/vim ~/.vimrc
cp ~/Programming/Dotfiles/Config-Files/bashrc ~/.bashrc
cp ~/Programming/Dotfiles/Config-Files/tmux.conf ~/.tmux.conf
cp ~/Programming/Dotfiles/Config-Files/alacritty.toml ~/.config/alacritty/
sudo cp ~/Programming/Dotfiles/Config-Files/touchscreen.conf /etc/X11/xorg.conf.d/

# Remove Unnecessary Files
sudo dnf -y remove rhythmbox
sudo dnf -y remove libreoffice*
sudo dnf -y remove flatpak
sudo dnf -y remove gnome-terminal
sudo dnf -y autoremove
sudo dnf -y clean all

# Basic File Management
cd ~/
mkdir Media/
rm -r Desktop/ Public/ Templates/ Music/
mv Videos/ Pictures/ Media/
cd ~/
mv linux ~/Programming/

reboot
