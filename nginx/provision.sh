#!/usr/bin/env bash

sudo apt-get install -y nginx
mkdir ~/log/nginx
touch ~/log/nginx/error.log
touch ~/log/nginx/access.log
