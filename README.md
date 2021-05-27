# Dotfiles

## Setup

```sh
sudo apt install -y vim git curl xsel tig ruby build-essential htop neofetch rsync
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
```

Ensure the config has been reloaded (open a new terminal if needed):
```sh
activate-odoo-venv
pip install --upgrade pip wheel
pip install -r requirements.txt inotify websocket-client pudb
```

## Setup Youtube-dl

```sh
sudo apt install -y atomicparsley ffmpeg
pip install --user youtube-dl

mkdir -p ~/.config/youtube-dl
ln -sr .youtube-dl-config ~/.config/youtube-dl/config
```
