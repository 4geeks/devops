#!/usr/bin/env bash

# ensure running as root
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

sudo apt-get install -y nginx
sudo touch /etc/nginx/sites-available/frontend.conf
cat > /etc/nginx/sites-available/frontend.conf <<- EOM
# Expires map
map $sent_http_content_type $expires {
    default                    off;
    text/html                  epoch;
    text/css                   max;
    application/javascript     max;
    ~image/                    max;
}
server {
    listen 80;
    listen [::]:80;
    server_name $1;
    #return 301 https://app.ezonseller.com$request_uri;
    root $2;
    location / {
    try_files $uri $uri/ /index.html;
    }
    location ~ /.well-known {
        allow all;
    }
    expires $expires;
}
EOM
sudo ln -s /etc/nginx/sites-available/frontend.conf /etc/nginx/sites-enabled/frontend.conf
sudo service nginx restart
