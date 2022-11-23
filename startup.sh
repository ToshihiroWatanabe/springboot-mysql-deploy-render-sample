#!/bin/bash
service mysql start
sleep 10
mysql -e "CREATE DATABASE sample_db; USE sample_db;"
mysql sample_db < /usr/src/init.sql
mysqladmin -u root password 'root'
java -jar /usr/src/demo-0.0.1-SNAPSHOT.jar