#!/usr/bin/env bash

apt update
apt install -y postgresql-9.5 postgresql-server-dev-9.5
sudo -u postgres bash -c "createuser --createdb --echo --login --superuser django "
sudo -u postgres bash -c "psql -c \"ALTER ROLE django WITH PASSWORD 'django';\""
sudo -u postgres bash -c "psql -c \"ALTER ROLE django WITH PASSWORD 'django';\""
