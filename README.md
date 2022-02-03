# Dotfiles

## Setup

```sh
sudo apt install -y fish vim git curl xsel tig build-essential htop neofetch rsync ripgrep jq
```

### Change Shell to Fish

```sh
chsh -s /usr/bin/fish
```

### Link config files

Bash/Zsh:
```sh
ln -s $(pwd)/.{gitconfig,vim*} ~/
```

Fish:
```sh
ln -s (pwd)/{.gitconfig,.vim*} ~/
ln -s (pwd)/config/fish ~/.config/
```

### Install VIM plugins

In VIM:
```vimscript
:PlugInstall
```

## Setup Yewtube (fork of mps-youtube)

Ensure `pipx` is installed:
```sh
sudo apt install python3-pip python3-venv mplayer
pip3 install --user pipx
```

```sh
pipx install git+https://github.com/iamtalhaasghar/yewtube.git
```

## Setup Postgresql

```sh
sudo apt install -y postgresql

sudo -u postgres createuser -s $USER
createdb $USER
```

## Setup Odoo environment

```sh
sudo apt install -y python3 python3-dev python3-pip python3-venv wkhtmltopdf libsasl2-dev libldap2-dev libpq-dev libjpeg-dev libxml2-dev libxslt1-dev
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

ln -sr config/youtube-dl ~/.config/
```

## Setup Gnome

```sh
sudo apt remove -y --auto-remove --purge gnome-games
sudo apt install -y gnome-sushi gnome-tweaks gnome-shell-extension-prefs gnome-shell-extension-appindicator
```

## Setup VSCode

Install Visual Studio Code through either `.deb` or `snap` package.

```sh
mkdir -p ~/.config/Code
ln -sr config/Code/User ~/.config/Code/

code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension ms-python.python
code --install-extension redhat.vscode-xml
code --install-extension rust-lang.rust
code --install-extension be5invis.toml
code --install-extension esbenp.prettier-vscode
```

# Firefox (Flatpak)

## Fonts issue

See https://bugzilla.mozilla.org/show_bug.cgi?id=1621915

```sh
sudo flatpak install flathub org.mozilla.firefox

mkdir -p ~/.var/app/org.mozilla.firefox/config/fontconfig/

cat > ~/.var/app/org.mozilla.firefox/config/fontconfig/fonts.conf << EOF
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
    <!-- Disable bitmap fonts. -->
    <selectfont><rejectfont><pattern>
        <patelt name="scalable"><bool>false</bool></patelt>
    </pattern></rejectfont></selectfont>
</fontconfig>
EOF
```

## GPU accelerated decoding

```sh
sudo flatpak install flathub org.freedesktop.Platform.ffmpeg-full
```
