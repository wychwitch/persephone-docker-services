#!/bin/bash
./persephone_install.venv.sh
echo 'from persephone_wsgi import app as application' | tee /var/www/html/persephone.wsgi
cd /var/www/html
source environment/bin/activate && python -m pip install mysqlclient
