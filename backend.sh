#!/usr/bin/env bash

sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl restart all
sudo service nginx restart
