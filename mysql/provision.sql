DROP DATABASE IF EXISTS django;
CREATE database django;
DROP USER 'django'@'localhost';
CREATE USER 'django'@'localhost' IDENTIFIED BY 'django';
GRANT ALL PRIVILEGES ON *.* TO 'django'@'localhost';
