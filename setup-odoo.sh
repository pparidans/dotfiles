#!/usr/bin/bash

#
# Postgresql
#
sudo apt install -y postgresql postgresql-server-dev-all
sudo -u postgres createuser -s $USER
createdb $USER

#
# Python
#
sudo apt install -y python3 python3-dev python3-pip wkhtmltopdf libsasl2-dev libldap2-dev libxml2-dev libxslt1-dev libjpeg-dev

echo "export PATH=\$HOME/.local/bin:\$PATH\n\n$(cat $HOME/.zshrc)" > $HOME/.zshrc

# Reload config
source $HOME/.zshrc

pip3 install --user virtualenvwrapper
echo "\nVIRTUALENVWRAPPER_PYTHON=$(which python3)" >> $HOME/.zshrc
echo "\nplugins+=virtualenvwrapper" >> $HOME/.zshrc
echo "\nsource \$ZSH/oh-my-zsh.sh" >> $HOME/.zshrc

# Reload config
source $HOME/.zshrc

mkvirtualenv -p $(which python3) odoo-venv
workon odoo-venv
pip install --upgrade pip
pip install watchdog pudb

#
# Odoo
#
ln -sr .oh-my-zsh/plugins/odoo $HOME/.oh-my-zsh/plugins/
echo "\nplugins+=odoo" >> $HOME/.zshrc
echo "\nsource \$ZSH/oh-my-zsh.sh" >> $HOME/.zshrc

# Reload config
source $HOME/.zshrc

# Git checkouts
CURRENT_PWD=$(pwd)
mkdir $HOME/Odoo

git clone git@github.com:odoo/odoo.git $HOME/Odoo/odoo
cd $HOME/Odoo/odoo
git remote add dev git@github.com:odoo-dev/odoo.git
git config user.email app@odoo.com
git fetch --all
workon odoo-venv
pip install -r requirements.txt

git clone git@github.com:odoo/enterprise.git $HOME/Odoo/enterprise
cd $HOME/Odoo/enterprise
git remote add dev git@github.com:odoo-dev/enterprise.git
git config user.email app@odoo.com
git fetch --all

git clone git@github.com:odoo/mobile.git $HOME/Odoo/mobile
cd $HOME/Odoo/mobile
git config user.email app@odoo.com

git clone git@github.com:odoo/internal.git $HOME/Odoo/internal
cd $HOME/Odoo/internal
git config user.email app@odoo.com

git clone git@github.com:odoo/upgrade.git $HOME/Odoo/upgrade
cd $HOME/Odoo/upgrade
git config user.email app@odoo.com

cd CURRENT_PWD
