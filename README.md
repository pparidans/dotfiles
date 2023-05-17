# Dotfiles

## Setup

### Utilities

Debian:
```sh
sudo apt install -y fish git xsel vim vim-gtk3 tig bat curl htop neofetch rsync tree ripgrep fzf build-essential
sudo apt install -y -t bullseye-backports fish git
```
Fedora:
```sh
sudo dnf group install "C Development Tools and Libraries" "Development Tools"
sudo dnf install fish xsel vim vim-X11 git tig bat curl htop neofetch rsync tree ripgrep fzf util-linux-user
```

### Change Shell to Fish

```sh
chsh -s /usr/bin/fish
```

### Link config files

From the dotfiles directory:
```sh
ln -sr {.gitconfig,.vim*} ~/
ln -sr config/fish ~/.config/
sudo ln -s (pwd)/etc/g810-led /etc/
```

### Install VIM plugins

In VIM:
```vimscript
:PlugInstall
```

## Setup Postgresql

```sh
sudo apt install -y postgresql
```

```sh
sudo dnf install postgresql-server postgresql-contrib
```

```sh
sudo -u postgres createuser -s $USER
createdb $USER
```

## Setup Nix

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Setup Gnome

```sh
sudo apt remove -y --auto-remove --purge gnome-games
sudo apt install -y gnome-sushi gnome-tweaks gnome-shell-extension-prefs gnome-shell-extension-appindicator
```

```sh
sudo dnf install sushi gnome-tweaks
sudo dnf swap gnome-terminal gnome-console
```

## Setup Odoo development environment

### Dependencies

```sh
sudo apt install python3 python3-dev python3-wheel python3-venv wkhtmltopdf libsasl2-dev libldap2-dev libpq-dev libjpeg-dev libxml2-dev libxslt1-dev
```

```sh
sudo dnf install python3.10 python3.10-dev libpq-devel openldap-devel`
```

### Create VirtualEnv

From the Odoo community directory:
```sh
python3.10 -m venv --prompt odoo --upgrade-deps .venv
pip install -r requirements-dev.txt
pip install -r requirements.txt
```
