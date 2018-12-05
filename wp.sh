#!/usr/bin/env bash


# https://www.howtoforge.com/tutorial/installing-nginx-with-php7-fpm-and-mysql-on-ubuntu-16.04-lts-lemp/

apt update
apt install -y apache2 mysql-server-5.7 php7.2 php7.2-mysql
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
mysql -u root -p -ve "create database cobuild"
mysql -u root -p -ve "create user 'wordpress'@'localhost' identified by 'cobuild123'"
mysql -u root -p -ve "grant all privileges on cobuild.* to 'wordpress'@'localhost'"
mysql -u root -p -ve "flush privileges"
mkdir wordpress && cd wordpress
wp core download
wp core config --dbname=cobuild --dbuser=wordpress --dbpass="cobuild123"
wp core install --url="cobuildlab.com" --title="Cobuild Lab" --admin_user="alacret" --admin_password="a18064066" --admin_email="alacret@gmail.com"
rm wp-config-sample.php
echo "define('FS_METHOD', 'direct');" >> wp-config.php
wp plugin install wordpress-seo --activate
wp theme delete twentyfourteen
wp theme delete twentyfifteen
wp theme delete twentysixteen
sudo mv wordpress/ /var/www/ & cd /var/www
chown -R deploy:www-data wordpress/
find wordpress/ -type d -exec chmod g+s {} \;
chmod g+w wordpress/wp-content
chmod -R g+w wordpress/wp-content/themes
chmod -R g+w wordpress/wp-content/plugins

# If apache make sure that in httpd.conf or apache2.conf the directory /var/www has ALLOWWIRTE ALL