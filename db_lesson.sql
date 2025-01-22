Q1回答
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| db_lesson          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> USE db_lesson;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql>  SHOW TABLES;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| people              |
| reports             |
+---------------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE departments (
    ->   department_id INT unsigned AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ->   name VARCHAR(20) NOT NULL,
    ->   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->   updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ->   );
Query OK, 0 rows affected (0.01 sec)

mysql> DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.00 sec)



Q2回答
mysql>  SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| db_lesson          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE db_lesson;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| departments         |
| people              |
| reports             |
+---------------------+
3 rows in set (0.01 sec)

mysql> use people
ERROR 1049 (42000): Unknown database 'people'
mysql> DESC people;
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type             | Null | Key | Default           | Extra                                         |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id  | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name       | varchar(20)      | NO   |     | NULL              |                                               |
| email      | varchar(255)     | YES  | UNI | NULL              |                                               |
| age        | tinyint unsigned | YES  |     | NULL              |                                               |
| gender     | tinyint          | YES  |     | NULL              |                                               |
| created_at | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.00 sec)

mysql> ALTER TABLE people ADD COLUMN department_id INT unsigned;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC people;
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type             | Null | Key | Default           | Extra                                         |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id     | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)      | NO   |     | NULL              |                                               |
| email         | varchar(255)     | YES  | UNI | NULL              |                                               |
| age           | tinyint unsigned | YES  |     | NULL              |                                               |
| gender        | tinyint          | YES  |     | NULL              |                                               |
| created_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
| department_id | int unsigned     | YES  |     | NULL              |                                               |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
8 rows in set (0.00 sec)

mysql> ALTER TABLE people MODIFY department_id int unsigned AFTER email;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC people;
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type             | Null | Key | Default           | Extra                                         |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id     | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)      | NO   |     | NULL              |                                               |
| email         | varchar(255)     | YES  | UNI | NULL              |                                               |
| department_id | int unsigned     | YES  |     | NULL              |                                               |
| age           | tinyint unsigned | YES  |     | NULL              |                                               |
| gender        | tinyint          | YES  |     | NULL              |                                               |
| created_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
8 rows in set (0.00 sec)

mysql> 
