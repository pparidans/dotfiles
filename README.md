# Dotfiles

## Setup

### Utilities

```sh
sudo apt install -y git xsel wl-clipboard tig curl btop rsync tree ripgrep fzf build-essential shellcheck
```

### Fonts

```sh
sudo apt install -y fonts-recommended fonts-powerline
```

### Link config files

From the dotfiles directory:
```sh
ln -sr {.gitconfig,.bash_aliases} ~/
```

### Install (Neo)VIM plugins

For VIM:
```sh
sudo apt install -y vim-nox
ln -sr .vim ~/
```

For NeoVIM:
```sh
sudo apt install -y neovim
ln -sr .vim ~/.config/nvim
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

