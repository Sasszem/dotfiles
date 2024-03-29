#!/bin/bash
apt-get update > /dev/null
apt-get install -y zsh git python3-pip fdupes

pip3 install thefuck


install_fonts() {
	# installing nerdfonts

	mkdir -p temp && cd temp
	wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf" -q --show-progress
	wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold.ttf" -q --show-progress
	wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Italic.ttf" -q --show-progress
	wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold Italic.ttf" -q --show-progress
	sudo mv ./*.ttf /usr/share/fonts/truetype/

	fc-cache -f -v > /dev/null
	cd ..

}

sudo -u "$SUDO_USER" bash -c "$(declare -f install_fonts); install_fonts"

# run oh-my-zsh installer
echo "Setting up omZsh"
sudo -u "$SUDO_USER" sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
