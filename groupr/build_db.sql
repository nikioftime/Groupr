use mysql;
create user 'groupr'@'%' identified by 'grouprsp16';
GRANT ALL PRIVILEGES ON `grouprsp_cs411`.* TO 'groupr'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `test_grouprsp_cs411`.* TO 'groupr'@'%' WITH GRANT OPTION;
create database grouprsp_cs411;
use grouprsp_cs411;
source db.sql;
show tables;