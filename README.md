# Dotfiles

## Setup

```sh
sudo apt install -y vim git curl xsel tig ruby build-essential htop neofetch
```

```sh
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
sudo apt install -y python3 python3-pip python3-venv wkhtmltopdf libsasl2-dev libldap2-dev libpq-dev

activate-venv
pip install --upgrade pip
pip install -r requirements.txt inotify websocket-client pudb
```

## Setup Youtube-dl

```sh
sudo apt install atomicparsley ffmpeg
pip install --user youtube-dl

mkdir -p ~/.config/youtube-dl
ln -sr .youtube-dl-config ~/.config/youtube-dl/config
```
