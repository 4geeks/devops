#!/usr/bin/env bash

apt update
apt install -y postgresql-9.5 postgresql-server-dev-9.5
sudo -u postgres bash -c "createuser --createdb --echo --login --superuser massone "
sudo -u postgres bash -c "psql -c \"ALTER ROLE massone WITH PASSWORD 'postgres123';\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE massone OWNER massone;\""
sudo echo "local   all             django          md5" >> /etc/postgresql/9.5/main/pg_hba.conf
sudo service postgresql restart