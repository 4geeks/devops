#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org=4.0.0 mongodb-org-server=4.0.0 mongodb-org-shell=4.0.0 mongodb-org-mongos=4.0.0 mongodb-org-tools=4.0.0
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo systemctl start mongod
sudo systemctl enable mongod

:'
{
  user: username,
  pwd: password,
  roles: [
    { role: "readWrite", db: "payklever" }
  ]
}


db.createUser(
  {
    user: "payklever",
    pwd: "paypass",
    roles: [ { role: "readWrite", db: "payklever" }
             ]
  }
)
'

#https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-mongodb-on-ubuntu-16-04