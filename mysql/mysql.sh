#!/usr/bin/env bash

apt update
apt install -y mysql-server-5.7 libmysqlclient-dev
mysql -u root -proot < provision.sql