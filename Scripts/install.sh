#!/bin/bash

# Update system
sudo dnf update -y

# Install individual packages
sudo dnf install -y git svn xsel gdb valgrind make gcc g++ obs-studio neofetch qemu nasm vim java-21-openjdk-devel.x86_64 
sudo dnf install -y kernel-devel kernel-headers 

# Install packages required to compile the Linux kernel
sudo dnf install -y ncurses-devel bc bison flex elfutils-libelf-devel openssl-devel dwarves

# Arduino CLI install via curl script
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
cd bin
sudo mv arduino-cli /usr/local/bin
cd ..
rm -r bin/
cd

# Clone the Linux Kernel repository
git clone https://github.com/torvalds/linux
cd linux 
make defconfig
make -j$(nproc)

# Configure git
git config --global user.name "Enter Name Here"
git config --global user.email "Enter Email Here"
git config --global core.editor vi
git config --global pull.rebase true  
git config --global init.defaultBranch main  
git config --global color.ui auto  

# Print success message
echo "All requested packages and configurations have been installed!"
