# Dotfiles

## Setup

### Utilities

```sh
sudo apt install -y git xsel wl-clipboard tig curl htop rsync ripgrep fzf fd-find build-essential shellcheck
```

### Fonts

```sh
sudo apt install -y fonts-recommended fonts-powerline
```

### Configure Git

From the dotfiles directory:
```sh
ln -sr gitconfig ~/.gitconfig
```

### Configure Bash

From the dotfiles directory:
```sh
ln -sr bashrc ~/.bashrc
```

### Install Fish

```sh
sudp apt install -y fish
```

From the dotfiles directory:
```sh
ln -sr config/fish ~/.config/
```

### Install (Neo)VIM

```sh
sudo apt install -y neovim
```

From the dotfiles directory:
```sh
ln -sr config/nvim ~/.config/
```

Inside (Neo)VIM:
```vimscript
:PlugInstall
```

### Powerline

```
sudo apt install -y powerline powerline-gitstatus fonts-powerline
```

### Postgresql

```sh
sudo apt install -y postgresql
```

```sh
sudo -u postgres createuser -s $USER
createdb $USER
```

### Gnome

Disable caps-lock keybinding:
```sh
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:none']"
```

### Odoo development environment

```sh
sudo apt install python3 python3-dev python3-wheel python3-venv wkhtmltopdf libsasl2-dev libldap2-dev libpq-dev libjpeg-dev libxml2-dev libxslt1-dev
```

