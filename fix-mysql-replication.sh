#!/bin/bash
#Script to fix mysql database replication error
#Author of this script is Richard Myrtin
#
#
#
#Mysql root password
#
aaa=$
#
#Mysql root user
#
bbb=$root
#
#Mysql host
#
ccc=$localhost
#
#Mysql root pw file
ddd=$(</root/mysql-pass)
mysql -u $bbb -p$ddd -e "SHOW SLAVE STATUS \G"
sleep 1
mysql -u $bbb -p$ddd -e "STOP SLAVE;"
sleep 1
mysql -u $bbb -p$ddd -e "SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;"
sleep 1
mysql -u $bbb -p$ddd -e "START SLAVE;"
sleep 1
mysql -u $bbb -p$ddd -e "SHOW SLAVE STATUS \G"
