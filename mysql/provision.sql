DROP DATABASE IF EXISTS django;
CREATE database django;
use django;
DROP USER IF EXISTS 'django'@'localhost';
CREATE USER 'django'@'localhost' IDENTIFIED BY 'django';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'localhost';
