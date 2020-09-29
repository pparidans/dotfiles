#!/usr/bin/zsh

#
# Postgresql
#
# sudo apt install -y postgresql postgresql-server-dev-all

# sudo -u postgres createuser -s $USER
# createdb $USER

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

#
# Odoo
#
mkvirtualenv -p $(which python3) odoo-venv
echo "\nplugins+=odoo" >> $HOME/.zshrc
echo "\nsource \$ZSH/oh-my-zsh.sh" >> $HOME/.zshrc

# Reload config
source $HOME/.zshrc
