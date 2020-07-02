# Dotfiles

## Setup

```sh
sudo apt install -y vim ack git curl xsel tig ruby build-essential htop zsh neofetch
```

```sh
ln -sr .ackrc ~/
ln -sr .oh-my-zsh/plugins/odoo ~/.oh-my-zsh/plugins/
ln -sr .oh-my-zsh/plugins/nodenv ~/.oh-my-zsh/plugins/
ln -sr .oh-my-zsh/plugins/pasteboard ~/.oh-my-zsh/plugins/
ln -sr .gitconfig ~/
ln -sr .vimrc ~/
ln -sr .vim ~/
```

## Setup Postgresql

```sh
sudo apt install -y postgresql postgresql-server-dev-all
```

```sh
sudo -u postgres createuser -s $USER
createdb $USER
```

## Setup Odoo environment

```sh
sudo apt install -y python3 python3-dev python3-pip libsasl2-dev libldap2-dev libxml2-dev libxslt1-dev libjpeg-dev
```

```sh
pip3 install --user virtualenvwrapper
echo -e "VIRTUALENVWRAPPER_PYTHON=$(which python3)\n\n$(cat ~/.zshrc)" > ~/.zshrc
echo -e "export PATH=\$HOME/.local/bin:\$PATH\n$(cat ~/.zshrc)" > ~/.zshrc
```

Enable the oh-my-zsh plugins `virtualenvwrapper`, `git`, `odoo` in `~/.zshrc` and reload the shell.

```sh
mkvirtualenv -p $(which python3) odoo-venv
workon odoo-venv
pip install -r requirements.txt
pip install inotify websocket-client pudb
```
