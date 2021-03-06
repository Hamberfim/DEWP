#!/bin/bash -e
# @author Anthony Hamlin
# install mssql-server on ubuntu | requires Ubuntu 18.04 LTS or later | SUDO - Human interaction

# import ms GPG keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# add the Ubuntu Microsoft SQL repo
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"

# update ubuntu package info
sudo apt-get update

# install mssql-server
sudo apt-get install -y mssql-server

# run mssql-server config/setup
sudo /opt/mssql/bin/mssql-conf setup

# test if service is running
systemctl status mssql-server --no-pager

# install command line tools
sudo apt-get install mssql-tools unixodbc-dev -y


# make command line tools accessible to bash
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

########## Example use for mssql-server #########
## connect locally
# sqlcmd -S localhost -U SA -P '<YourPassword>'

## create a test db
# CREATE DATABASE TestDB

## write a qry
# SELECT Name from sys.Databases

## execute two previous commands
# GO

## Use the new DB and create a new table in TestDB
# USE TestDB

## creat a table call Inventory
# CREATE TABLE Inventory (id INT, name NVARCHAR(50), quantity INT)
# CREATE TABLE CanGoods (id INT NOT NULL IDENTITY PRIMARY KEY, productname NVARCHAR(50), quantity INT)

## insert data into the Inventory table
# INSERT INTO Inventory VALUES (1, 'banana', 150); INSERT INTO Inventory VALUES (2, 'orange', 154);
# INSERT INTO Inventory VALUES (3, 'apple', 120); INSERT INTO Inventory VALUES (4, 'pear', 104);
# INSERT INTO Inventory VALUES (5, 'kiwi', 85); INSERT INTO Inventory VALUES (6, 'raspberry', 100);

# INSERT INTO CanGoods VALUES ('red beans', 50); INSERT INTO CanGoods VALUES ('pinto beans', 54);
# INSERT INTO CanGoods VALUES ('green beans', 47); INSERT INTO CanGoods VALUES ('carrots', 58);

## execute these commands
# GO

## Select data from the table
# SELECT * FROM Inventory;
# SELECT * FROM Inventory WHERE quantity > 119;

# SELECT * FROM CanGoods;
# SELECT * FROM CanGoods WHERE quantity > 53;

## execute the command
# GO

## exit the sqlcmd shell/prompt
# QUIT

######### END #########
