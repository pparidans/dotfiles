default:

UTILS := fish vim git tig curl xsel htop neofetch rsync ripgrep jq tree
setup_debian:
	sudo apt update
	sudo apt install $(UTILS) build-essential

setup_arch:
	sudo pacman -Syu $(UTILS) base-devel

setup_fish:
	ln -sr config/fish ~/.config/
	chsh -s `which fish`

setup_git:
	ln -sr .gitconfig ~/

setup_vim:
	ln -sr .vim* ~/

setup_g810:
	sudo ln -sr etc/g810-led /etc/
