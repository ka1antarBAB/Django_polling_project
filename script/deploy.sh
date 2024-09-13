#!/usr/bin/env bash

# activate the virtual environment
source ~/venv/bin/activate

# cd into the project code
cd /var/www/polling/

# pull the latest codebase
git pull

# install the app dependencies
pip install -r requirements.txt

# run the database migrations
python manage.py migrate

# run collect static command
python manage.py collectstatic --no-input

# put all other commands thar required for you specific app

# deactivate the virtual environment
deactivate

# restart nginx
sudo systemctl restart nginx

# restart the gunicorn
sudo systemctl restart gunicorn

