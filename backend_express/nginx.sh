#!/usr/bin/env bash

# ensure running as root
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

sudo apt-get install -y nginx
sudo touch /etc/nginx/sites-available/express.conf
/etc/nginx/sites-available/express.conf <<- EOM
server {
    listen 80;
    listen [::]:80;
    server_name $1;
    #return 301 https://app.ezonseller.com$request_uri;
    location = /favicon.ico { access_log off; log_not_found off; }
    location / {
        include proxy_params;
        proxy_pass http://localhost:8000;
    }
    location /static/ {
        root /home/deploy/static;
    }
}
EOM
sudo service nginx restart
