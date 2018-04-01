#!/usr/bin/env bash

apt update
apt install -y postgresql-10.3 postgresql-server-dev-10.2
sudo -u postgres bash -c "createuser --createdb --echo --login --superuser django "
sudo -u postgres bash -c "psql -c \"ALTER ROLE vagrant WITH PASSWORD 'django';\""
sudo -u postgres bash -c "psql -c \"ALTER ROLE vagrant WITH PASSWORD 'django';\""
