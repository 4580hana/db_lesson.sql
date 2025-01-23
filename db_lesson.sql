Q1回答

CREATE TABLE departments (
       department_id INT unsigned AUTO_INCREMENT NOT NULL PRIMARY KEY,
       name VARCHAR(20) NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
       );


DESC departments;



Q2回答

ALTER TABLE people ADD COLUMN department_id INT unsigned;
ALTER TABLE people MODIFY department_id int unsigned AFTER email;


Q3回答
INSERT INTO departments (name)
   VALUES
    ("営業"),
    ("開発"),
    ("経理"),
    ("人事"),
    ("情報システム");

INSERT INTO people (name, email, department_id, age, gender)
VALUES
   ('歌仙兼定', 'kasen@gizumo.jp',1, 31,1),
   ('和泉守兼定', 'izuminokami@gizumo.jp',2, 29,1),
   ('燭台切光忠', 'shokudaigiri@gizumo.jp', 1, 31, 1),
   ('へし切長谷部', 'hesikiri@gizumo.co.jp',2, 28,1),
   ('山姥切長義','chogi@gizumo.co.jp',4,26,1),
   ('一文字則宗', NULL,'5',NULL,NULL),
   ('山姥切国広','kinihiro@gizumo.jp',1,26,1),
   ('松井江','matuigou@gizumo.jp',3,25,1),
   ('肥前忠弘','hizen@gizumo.co.jp',2,24,1),
   ('南海太郎朝尊','nannkai@gizumo.co.jp',2,35,1);

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

回答４
SELECT name, department_id
　FROM people
　WHERE department_id IS NULL;

INSERT INTO people (name, department_id)
   VALUES
   ('田中ゆうこ', 2),
   ('福田だいすけ',  1),
   ('豊島はなこ', 3),
   ('早坂てつお', 1),
   ('不思議沢みちこ',1);

 DELETE
  FROM people WHERE person_id in (42,43,44,45,46);


UPDATE people
   SET department_id  = 1;
SELECT * FROM people;

UPDATE  people
SET department_id  = 2
WHERE person_id in (33,35,40,41,28);

UPDATE  people
SET department_id  = 3
WHERE person_id in (39,30);

15 rows in set (0.00 sec)

Q5回答
SELECT * FROM people WHERE gender = 1;
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;


Q6回答
SELECT
  `name`, `email`, `age`
テーブル上から`name`, `email`, `age`というカラムのレコードのみを表示する

FROM
  `people`
 `people`というテーブルの中から実行する

WHERE
  `department_id` = 1
テーブルの中の`department_id`というカラムの中で１と記載のあるのもという条件

ORDER BY
  `created_at`;
テーブルの中の`created_at`というカラムの中のレコードの数に沿って並び順を指定する

Q7回答

SELECT * FROM people WHERE age >= 20 AND age <= 29 AND gender = 2
or age >= 40 AND age <= 49 AND gender = 1;


Q8回答
SELECT * FROM people WHERE  department_id = 1 ORDER BY age DESC;



Q9回答
SELECT AVG(age) AS average_age FROM people GROUP BY  department_id = 2 AND gender = 2;

Q10回答

SELECT * FROM people  INNER JOIN reports ON people.person_id  = reports.person_id;

SELECT name, department_id , content FROM people  INNER JOIN reports ON people.person_id  = reports.person_id;                                                                                                                    |


Q11回答

 SELECT * FROM people left outer JOIN reports ON people.person_id  = reports.person_id  WHERE content  IS NULL;





