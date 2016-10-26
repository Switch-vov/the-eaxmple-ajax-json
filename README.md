# create database
create DATABASE test character set utf8;

use test;

# create table user
CREATE table `user`(
	uid VARCHAR(20),
	username VARCHAR(20)
) engine innodb char set utf8;

## insert into user
insert into `user` VALUES('u0001', 'switch');

SELECT * from `user`;

# create table word
CREATE TABLE word(
	pid varchar(20) PRIMARY KEY,
	word VARCHAR(100),
	pinyin VARCHAR(200)
) ENGINE INNODB char set utf8;

## insert into word
INSERT INTO word(pid,word,pinyin) VALUES('p001','服装','fuzhuang');
INSERT INTO word(pid,word,pinyin) VALUES('p002','男装','nanzhuang');
INSERT INTO word(pid,word,pinyin) VALUES('p003','女装','nvzhuang');
INSERT INTO word(pid,word,pinyin) VALUES('p004','电脑','diannao');
INSERT INTO word(pid,word,pinyin) VALUES('p005','奢侈品','shechipin');
INSERT INTO word(pid,word,pinyin) VALUES('p006','图书','tushu');
INSERT INTO word(pid,word,pinyin) VALUES('p007','食品','shipin');

select * from word;
