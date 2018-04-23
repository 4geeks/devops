#!/usr/bin/env bash

sudo adduser $1
sudo echo "$1 ALL=(ALL:ALL) ALL" >> /etc/sudoers
mkdir /home/$1/frontend
chown $1:$1 /home/$1/frontend