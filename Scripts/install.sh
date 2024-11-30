#!/bin/bash

update_system()
{
	sudo dnf update -y
}

install_packages()
{
	sudo dnf install -y git svn make gcc g++ valgrind gdb qemu nasm ncurses-devel \
		bc bison flex openssl-devel dwarves elfutils-libelf-devel \
		cscope ctags java-21-openjdk-devel mysql-server \
		mysql-connector-java wl-clipboard alacritty obs-studio \
		texlive-scheme-full vim zathura zathura-pdf-poppler \
		btop busybox gnupg mysql-devel grimshot
}

install_arduino_cli()
{
	curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
	sudo mv bin/arduino-cli /usr/local/bin
	rm -r bin/
	sudo usermod -aG dialout $USER
	arduino-cli config init
	arduino-cli core update-index
	arduino-cli core install arduino:avr
	arduino-cli core upgrade
}

setup_kernel()
{
	cd "$HOME"
	git clone https://github.com/torvalds/linux
	cd linux
	make defconfig
	make -j$(nproc)
	mv "$HOME/linux" "$HOME/Programming/linux"
}

configure_git()
{
	git config --global user.name "Enter Name Here"
	git config --global user.email "Enter Email Here"
	git config --global core.editor vi
	git config --global pull.rebase true
	git config --global init.defaultBranch main
	git config --global color.ui auto
}

organize_config_files()
{
	mkdir -p "$HOME/.config/alacritty" "$HOME/.vim/undo"
	cp "$HOME/Programming/Dotfiles/Config-Files/vimrc" "$HOME/.vimrc"
	cp "$HOME/Programming/Dotfiles/Config-Files/tmux.conf" "$HOME/.tmux.conf"
	cp "$HOME/Programming/Dotfiles/Config-Files/alacritty.toml" "$HOME/.config/alacritty/"
	cp "$HOME/Programming/Dotfiles/Config-Files/bashrc" "$HOME/.bashrc"
}

cleanup()
{
	sudo dnf remove -y htop kitty
	sudo dnf autoremove -y
	sudo dnf clean all
}

main()
{
	update_system
	install_packages
	install_arduino_cli
	setup_kernel
	configure_git
	organize_config_files
	cleanup
}

main

