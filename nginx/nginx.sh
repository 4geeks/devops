#!/usr/bin/env bash

# ensure running as root
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

sudo apt-get install -y nginx
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/