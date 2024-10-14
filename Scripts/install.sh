#!/bin/bash

# i3 Fedora based Personal Installation Script

# General Package Installation
sudo dnf update -y
sudo dnf install -y git svn xsel gdb valgrind make gcc g++ neofetch qemu nasm
sudo dnf install -y kernel-devel kernel-headers ctags tmux java-21-openjdk-devel.x86_64 
sudo dnf install -y ncurses-devel bc bison flex elfutils-libelf-devel openssl-devel dwarves
sudo dnf install -y alacritty polybar mpv obs-studio scrot
echo "Packages Installed!"

# Arduino-CLI
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
cd bin/
sudo mv arduino-cli /usr/local/bin
cd ..
rm -r bin/
sudo usermod -aG dialout $USER
arduino-cli config init
arduino-cli config dump
arduino-cli core update-index
arduino-cli core install arduino:avr
echo "Minimal Arduino-CLI all set up!"

# Linux Kernel
cd
git clone https://github.com/torvalds/linux
cd linux
make defconfig
make -j$(nproc)
cd
mv ~/linux/ ~/Programming
echo "Linux Kernel cloned and compiled!"

# Configure Git
git config --global user.name "Enter Name Here"
git config --global user.email "Enter Email Here"
git config --global core.editor vi
git config --global pull.rebase true  
git config --global init.defaultBranch main  
git config --global color.ui auto 
echo "Git Configured!"

# Move Files Into Correct Locations
mkdir ~/.config/alacritty/
mkdir ~/.config/polybar/
cp ~/Programming/Dotfiles/Config-Files/exrc ~/.exrc
cp ~/Programming/Dotfiles/Config-Files/bashrc ~/.bashrc
cp ~/Programming/Dotfiles/Config-Files/tmux.conf ~/.tmux.conf
cp ~/Programming/Dotfiles/Config-Files/alacritty.toml ~/.config/alacritty/
cp ~/Programming/Dotfiles/Config-Files/config.ini ~/.config/polybar/
cp ~/Programming/Dotfiles/Config-Files/config ~/.config/i3/
sudo cp ~/Programming/Dotfiles/Config-Files/touchscreen.conf /etc/X11/xorg.conf.d/
echo "Config Files Moved to Appropriate Locations"

# Remove Unnecessary Files
sudo dnf remove i3-sensible-terminal
sudo dnf -y autoremove
sudo dnf -y clean all
echo "Cleaned up all files"

# Basic File Management
cd
mkdir Media/
rm -r Desktop/ Public/ Templates/ Music/
mv Videos/ Pictures/ Media/

# Print success message
echo "Automation Process Complete!"
echo "Rebooting in 10 seconds"
sleep(10)
reboot
