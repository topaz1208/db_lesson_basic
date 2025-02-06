-- mysql -u root -p
-- use db_lesson ;
-- Q1
CREATE TABLE department (
    department_id INT unsigned NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

-- Q2
ALTER TABLE people ADD department_id INT unsigned AFTER email ;

-- Q3
INSERT INTO department(department_id, name, created_at, updated_at)
 VALUES
 ('1','営業', '2025-02-01 12:30:00', '2025-02-02 12:30:00'),
 ('2','開発', '2025-02-01 12:30:00', '2025-02-02 12:30:00'),
 ('3','経理', '2025-02-01 12:30:00', '2025-02-02 12:30:00'),
 ('4','人事', '2025-02-01 12:30:00', '2025-02-02 12:30:00'),
 ('5','情報システム', '2025-02-01 12:30:00', '2025-02-02 12:30:00');

INSERT INTO people (name, email, department_id, age, gender)
 VALUES
  ('笹木 智郁', 'sasaki@beyond-works.co.jp', 1, 25, 2),
  ('高間 二太朗', 'takama@beyond-works.co.jp', 1, 42, 1),
  ('遠藤 能岳', 'endo@beyond-works.co.jp', 1, 34, 1),
  ('池渕 万麻', 'ikebuchi@beyond-works.co.jp', 2, 61, 2),
  ('堀家 伶音', 'horike@beyond-works.co.jp', 2, 32, 2),
  ('小阪 佑理', 'kosaka@beyond-works.co.jp', 2, 22, 2),
  ('東間 恵生', 'touma@beyond-works.co.jp', 2, 48, 1),
  ('稲野辺 万奏', 'inanobe@beyond-works.co.jp', 3, 39, 2),
  ('川内 侑仁', 'kawauchi@beyond-works.co.jp', 4, 52, 1),
  ('牛尾 冴英', 'ushio@beyond-works.co.jp', 5, 47, 1);

INSERT INTO reports (person_id, content, created_at, updated_at) 
VALUES  
(8, '今日の朝ごはんについて', '2024-1-21 13:30:54', '2024-1-27 11:30:54'),
(9, '今日の昼ごはんについて', '2024-1-22 14:30:54', '2024-1-28 10:30:54'),
(10, '今日の夜のごはんについて', '2024-1-23 15:30:54', '2024-1-29 9:30:54'),
(11, '明日の朝ごはんについて', '2024-1-24 16:30:54', '2024-1-26 8:30:54'),
(12, '明日の昼ごはんについて', '2024-1-25 17:30:54', '2024-1-27 7:30:54'),
(13, '明日の夜ごはんについて', '2024-1-26 18:30:54', '2024-1-28 6:30:54'),
(14, '昨日の朝ごはんについて', '2024-1-27 19:30:54', '2024-1-29 5:30:54'),
(15, '昨日の昼ごはんについて', '2024-1-28 20:30:54', '2024-1-30 4:30:54'),
(16, '昨日の夜ごはんについて', '2024-1-27 19:30:54', '2024-1-29 5:30:54'),
(17, '先月の献立について', '2024-1-28 20:30:54', '2024-1-30 4:30:54');

-- Q4
UPDATE people SET department_id = '1' WHERE person_id = 1;
UPDATE people SET department_id = '2' WHERE person_id = 2;
UPDATE people SET department_id = '3' WHERE person_id = 3;
UPDATE people SET department_id = '4' WHERE person_id = 4;
UPDATE people SET department_id = '5' WHERE person_id = 6;

-- Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
peopleﾃｰﾌﾞﾙから作成日時の昇順で`department_id`ｶﾗﾑの値が1のﾚｺｰﾄﾞの中から`name`, `email`, `age`ｶﾗﾑを取得する。

-- Q7
SELECT name FROM people WHERE (gender = 1 AND age BETWEEN 40 AND 49)
OR(gender = 2 AND age BETWEEN 20 AND 29) ;

-- Q8
SELECT * FROM people WHERE department_id = 2 ORDER BY age ;

-- Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 1 AND gender = 2 ;

-- Q10
SELECT people.person_id, people.name, department.name AS department_name, reports.content
FROM people 
INNER JOIN reports ON people.person_id = reports.person_id
INNER JOIN department ON  people.department_id = department.department_id ;

-- Q11
SELECT people.person_id, people.name, reports.content
FROM people LEFT OUTER JOIN reports ON people.person_id = reports.person_id
WHERE content IS NULL ;



