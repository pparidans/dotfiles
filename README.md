# Dotfiles

## Setup

```sh
sudo apt install -y vim git curl xsel tig ruby build-essential htop neofetch
```

```sh
ln -sr .inputrc ~/
ln -sr .bash_aliases ~/
ln -sr .gitconfig ~/
ln -sr .vimrc ~/
ln -sr .vim ~/
ln -sr .vscode ~/
```

## Setup Postgresql

```sh
sudo apt install -y postgresql

sudo -u postgres createuser -s $USER
createdb $USER
```

## Setup Odoo environment

```sh
sudo apt install -y python3 python3-pip wkhtmltopdf libsasl2-dev libldap2-dev virtualenvwrapper

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

```

```sh
pip3 install --user virtualenvwrapper
echo -e "VIRTUALENVWRAPPER_PYTHON=$(which python3)\n\n$(cat ~/.zshrc)" > ~/.zshrc
echo -e "export PATH=\$HOME/.local/bin:\$PATH\n$(cat ~/.zshrc)" > ~/.zshrc
```

Enable the oh-my-zsh plugins `virtualenvwrapper`, `git`, `odoo` in `~/.zshrc` and reload the shell.

```sh
mkvirtualenv odoo-venv
workon odoo-venv
pip install --upgrade pip
pip install -r requirements.txt
pip install inotify websocket-client pudb
```
