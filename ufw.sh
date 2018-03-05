#!/usr/bin/env bash

sudo apt-get install -y ufw
sudo ufw status
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

