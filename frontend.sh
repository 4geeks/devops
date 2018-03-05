#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install nodejs build-essential
npm install pm2 -g

