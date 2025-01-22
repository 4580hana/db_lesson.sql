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
+---------------------+1 rows in set (0.00 sec)

mysql> CREATE TABLE departments (
       department_id INT unsigned AUTO_INCREMENT NOT NULL PRIMARY KEY,
       name VARCHAR(20) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
       );
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



Q2回答e
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

Q3回答
mysql> INSERT INTO departments (name)
   VALUES
    ("営業"),
    ("開発"),
    ("経理"),
    ("人事"),
    ("情報システム");
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

INSERT INTO people (name, email, department_id, age, gender)
VALUES
   ('歌仙兼定', 'kasen@gizumo.jp','1', 31,1),
   ('和泉守兼定', 'izuminokami@gizumo.jp','2', 29,1),
   ('燭台切光忠', 'shokudaigiri@gizumo.jp', '1', 31, 1),
   ('へし切長谷部', 'hesikiri@gizumo.co.jp','2', 28,1),
   ('山姥切長義','chogi@gizumo.co.jp','4',26,1),
   ('一文字則宗', NULL,'5',NULL,NULL),
   ('山姥切国広','kinihiro@gizumo.jp','1',26,1),
   ('松井江','matuigou@gizumo.jp','3',25,1),
   ('肥前忠弘','hizen@gizumo.co.jp','2',24,1),
   ('南海太郎朝尊','nannkai@gizumo.co.jp','2',35,1);

INSERT INTO  reports (person_id,content,created_at,updated_at)
     VALUES
     ('20','長谷部国重作の打刀。名の由来は、信長が膳棚の下に隠れた茶坊主をその棚ごと圧し切ったことから。
    ','2025/1/20','2025/1/21'),
     ('18','幕末から活躍した兼定の作であり、新撰組副長 土方歳三が愛用したと言われる大振りの刀
    ','2025/1/16','2025/1/21'),
     ('17','「之定」の異名を持つ、二代目兼定作の打刀。持ち主だった細川忠興が３６人の家臣を手討ちしたことから、三十六歌仙にちなんで歌仙兼定と呼ばれる。
    ','2024/12/28','2025/1/6'),
     ('23','霊剣『山姥切』を模して造られたとされる打刀。オリジナルでないことがコンプレックス。
    ','2025/1/12','2025/1/16'),
     ('19','備前長船派の事実上の祖といわれている刀工、光忠の作。名は、伊達政宗がこの太刀で家臣を斬った際にその勢いで燭台まで斬れたという話が由来。
    ','2025/1/16','2025/1/21'),
     ('25','岡田以蔵が使用していたとされる脇差。','2025/1/12','2025/1/18'),
     ('26','武市半平太が使用していたとされる打刀。学者然とした刀剣男士であり、知識で審神者を助ける。
    ','2025/1/10','2025/1/18'),                                            
     ('21','備前長船長義作の打刀。長義は長船派の主流とは別系統の刀工となる。写しであると言われている山姥切国広と共に伯仲の出来。
    ','2025/1/6','2025/1/21'),
     ('22' ,'福岡一文字派の作とされている太刀。則宗は福岡一文字派の始祖であり、後鳥羽院番鍛冶の一人として名高い。
    ','2025/1/21','2025/1/21'),
     ('24','越中国の刀工、郷義弘作の打刀。一国一城令の例外となった八代城主、松井興長が所持した。
    ','2025/1/6','2025/1/21');

