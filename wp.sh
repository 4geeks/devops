#!/usr/bin/env bash


# https://www.howtoforge.com/tutorial/installing-nginx-with-php7-fpm-and-mysql-on-ubuntu-16.04-lts-lemp/

apt update
apt install -y apache2 mysql-server-5.7 php7.0 php7.0-mysql
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
mysql -u root -p -ve "create database vmc"
mysql -u root -p -ve "create user 'wordpress'@'localhost' identified by '332411pwd'"
mysql -u root -p -ve "grant all privileges on vmc.* to 'wordpress'@'localhost'"
mysql -u root -p -ve "flush privileges"
mkdir wordpress && cd wordpress
wp core download
wp core config --dbname=vmc --dbuser=wordpress --dbpass="332411pwd"
wp core install --url="vemroyalconsulting.com" --title="Vem Royal Consulting" --admin_user="rob" --admin_password="_?robI5" --admin_email="rob@novecomputers.com"
rm wp-config-sample.php
echo "define('FS_METHOD', 'direct');" >> wp-config.php
wp plugin install wordpress-seo --activate
#wp theme install thebesttheme --activate
wp theme delete twentyfourteen
wp theme delete twentyfifteen
wp theme delete twentysixteen
sudo mv wordpress/ /var/www/
chown -R deploy:www-data wordpress/
find wordpress/ -type d -exec chmod g+s {} \;
chmod g+w wordpress/wp-content
chmod -R g+w wordpress/wp-content/themes
chmod -R g+w wordpress/wp-content/plugins