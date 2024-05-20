create database friends_human;
use friends_human;
CREATE TABLE `animal` (`id` Int NOT NULL AUTO_INCREMENT, `animal_name` Varchar(20) NOT NULL, PRIMARY KEY (`id`));
CREATE TABLE `home_animal`(`id` Int NOT NULL AUTO_INCREMENT, `home_name` Varchar(20) NOT NULL,`id_animal` Int, PRIMARY KEY (`id`));
CREATE INDEX `animal_home` ON `home_animal` (`id_animal`);
CREATE TABLE `cat`(  `id` Int NOT NULL AUTO_INCREMENT,  `cat_name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,  `commands` Varchar(200),
  `color` Varchar(20),  `id_home` Int,  PRIMARY KEY (`id`));
CREATE INDEX `home_cat` ON `cat` (`id_home`);

CREATE TABLE `dog`(  `id` Int NOT NULL AUTO_INCREMENT,  `dog_name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,  `commands` Varchar(200),
  `color` Varchar(20),  `id_home` Int,  PRIMARY KEY (`id`));
CREATE INDEX `home_dog` ON `dog` (`id_home`);

CREATE TABLE `hamster`(  `id` Int NOT NULL AUTO_INCREMENT,  `hamster_name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,  `commands` Varchar(200),  `color` Varchar(20),
  `id_home` Int,  PRIMARY KEY (`id`));
CREATE INDEX `home_hamster` ON `hamster` (`id_home`);

CREATE TABLE `pack_animal`(  `id` Int NOT NULL AUTO_INCREMENT,  `pack_name` Varchar(20) NOT NULL,  `id_animal` Int,  PRIMARY KEY (`id`));
CREATE INDEX `animal_pack` ON `pack_animal` (`id_animal`);

CREATE TABLE `camel`(  `id` Int NOT NULL AUTO_INCREMENT,  `name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,  `commands` Varchar(200),
  `color` Varchar(20),  `id_pack` Int,  PRIMARY KEY (`id`));
CREATE INDEX `pack_camel` ON `camel` (`id_pack`);

CREATE TABLE `horse`(  `id` Int NOT NULL AUTO_INCREMENT,  `name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,
  `commands` Varchar(200),  `color` Varchar(20),  `id_pack` Int,  PRIMARY KEY (`id`));
CREATE INDEX `pack_hourse` ON `horse` (`id_pack`);

CREATE TABLE `mule`(  `id` Int NOT NULL AUTO_INCREMENT,  `name` Varchar(30) NOT NULL,  `date_birth` Date NOT NULL,  `commands` Varchar(200),
  `color` Varchar(20),  `id_pack` Int,  PRIMARY KEY (`id`));
CREATE INDEX `pack_mule` ON `mule` (`id_pack`);

ALTER TABLE `home_animal` ADD CONSTRAINT `animal_to_home` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `cat` ADD CONSTRAINT `home_to_cat` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dog` ADD CONSTRAINT `home_to_dog` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `hamster` ADD CONSTRAINT `home_to_hamster` FOREIGN KEY (`id_home`) REFERENCES `home_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `camel` ADD CONSTRAINT `pack_to_camel` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `horse` ADD CONSTRAINT `pack_to_horse` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `mule` ADD CONSTRAINT `pack_to_mule` FOREIGN KEY (`id_pack`) REFERENCES `pack_animal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

insert into animal (animal_name) values ('Домашние животные'), ('Вьючные животные');
insert into home_animal (home_name, id_animal) values ('Собаки', 1), ('Кошки', 1), ('Хомяки', 1);
insert into pack_animal (pack_name, id_animal) values ('Лошади', 2), ('Верблюды', 2), ('Ослы', 2);

insert into cat (cat_name, date_birth, commands, color, id_home)
values
('Рыжик','2024-05-14','прыгать','рыжий', 2),
('Мурлык','2022-01-20','спать','белый', 2),
('Котяра','2023-06-11','лежать','черный', 2);

insert into dog (dog_name, date_birth, commands, color, id_home)
values
('Тузик','2019-06-14','голос сидеть считать','пегий', 1),
('Бобик','2018-01-22','спать','серо-белый', 1),
('Шарик','2013-06-11','лежать сидеть','черный', 1);

insert into hamster (hamster_name, date_birth, commands, color, id_home)
values
('Обжора','2024-02-14','кушать','коричневый', 3),
('Хомячун','2018-04-02','бегать','красный', 3);

insert into horse (name, date_birth, commands, color, id_pack)
values
('Ветер','2017-03-16','бегать','белый', 1),
('Рысак','2022-02-10','бегать','черный', 1);

insert into camel (name, date_birth, commands, color, id_pack)
values ('Верблюд','2012-04-16','идти','светло-коричневый', 2);

insert into mule (name, date_birth, commands, color, id_pack)
values ('Осел','2023-01-10','стоять','желтый', 3);

drop table camel;

SELECT id, name, commands, color, id_pack
FROM horse
UNION
SELECT id, name, commands, color, id_pack
FROM mule;

CREATE TABLE young_animal (
id int NOT NULL,
name varchar(50),
date_birth Datetime,
commands varchar(200),
color varchar(20),
age varchar(50));

INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, cat_name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM cat
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36; 


INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, dog_name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM dog
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36; 


INSERT INTO young_animal (id, name, date_birth, commands, color, age)
SELECT id, name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM horse
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36 
UNION ALL
SELECT id, name, date_birth, commands, color,
CONCAT(CAST(TIMESTAMPDIFF(YEAR, date_birth, NOW()) AS CHAR), " лет ", 
	CAST(MOD(TIMESTAMPDIFF(MONTH, date_birth, NOW()), 12)  AS CHAR), " мес.") AS age 
FROM mule
WHERE TIMESTAMPDIFF(MONTH, date_birth, NOW()) BETWEEN 12 AND 36;

SELECT * FROM (SELECT id, cat_name, dog_name, NULL as hamster_name, NULL as name, date_birth, commands, color FROM (
SELECT id, cat_name, NULL as dog_name, NULL AS hamster_name, NULL AS name, date_birth, commands, color FROM cat
UNION all 
SELECT id, NULL as cat_name, dog_name, NULL AS hamster_name, NULL AS name, date_birth, commands, color FROM dog) A
UNION ALL
SELECT id, NULL as cat_name, NULL as dog_name, hamster_name, NULL AS name, date_birth, commands, color FROM hamster) B
UNION ALL 
SELECT * FROM (
SELECT id, NULL AS cat_name, NULL AS dog_name, NULL AS hamster_name, name, date_birth, commands, color FROM horse
UNION ALL 
SELECT id, NULL AS cat_name, NULL AS dog_name, NULL AS hamster_name, name, date_birth, commands, color FROM mule 
) C;