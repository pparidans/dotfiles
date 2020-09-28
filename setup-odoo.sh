#!/usr/bin/sh

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

pip3 install --user virtualenvwrapper
echo "VIRTUALENVWRAPPER_PYTHON=$(which python3)\n\n$(cat ~/.zshrc)" > ~/.zshrc
echo "export PATH=\$HOME/.local/bin:\$PATH\n$(cat ~/.zshrc)" > ~/.zshrc

# Reload config
source ~/.zshrc

#
# Odoo
#
mkvirtualenv -p $(which python3) odoo-venv
