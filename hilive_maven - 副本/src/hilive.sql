﻿CREATE TABLE userinfo (id int not null PRIMARY KEY auto_increment,
username VARCHAR(20) not null DEFAULT '',
password VARCHAR(100) not null default '',
nickname VARCHAR(20) not null default '',
sex VARCHAR(4) not null default'未知',
avatar VARCHAR(200) not null default '',
phonenumber varchar(20) not null default '未知',
security_question varchar(50) not null default'未设置',
security_answer varchar(50) not null default'',
pageview_count INT not null default 1,
createtime datetime not null ,
online_time int not null default 0,
post_count int not null default 0,
answer_count int not null default 0
 );

create table msginfo(
id int not null PRIMARY KEY auto_increment,
type varchar(10) not null default '',
send_id int not null,
receive_id int not null
);

create table relationinfo(
my_id int not null,
type int not null,
her_id int not null
);

create table photos(
my_id int not null,
img_url varchar(200) not null default ''
);

create table articleinfo(
id int not null primary key auto_increment,
title varchar(100) not null default '未命名标题',
content longtext not null,
user_id int not null,
createtime datetime not null,
follow_count int not null default 0,
praise_count int not null default 0,
share_count int not null default 0,
comment_count int not null default 0
);

create table commentinfo(
id int not null primary key auto_increment,
content varchar(500) not null default '',
user_id int not null,
article_id int not null,
createtime datetime not null
);

CREATE TABLE questioninfo (id int not null PRIMARY KEY auto_increment,
user_id int not null ,
title VARCHAR(100) not null DEFAULT '',
content LONGTEXT not null DEFAULT '',
classification VARCHAR(30)not null DEFAULT'',
createtime datetime not null ,
browse_count int not null DEFAULT 0,
answer_count int not null DEFAULT 0,
share_count int not null DEFAULT 0
);

CREATE TABLE answerinfo (id int not null PRIMARY KEY auto_increment,
question_id int not null DEFAULT 0,
answer_userid int not null DEFAULT 0,
content LONGTEXT not null DEFAULT '',
createtime datetime not null ,
agree_count int not null DEFAULT 0
);

CREATE table goodsinfo (
id int not null PRIMARY KEY auto_increment,
goods_name VARCHAR(30) not NULL default '',
description varchar(200) not null default '',
price int not null default 0,
brand varchar(20) not null default '',
goods_type varchar(20) not null default '',
score int not null DEFAULT 0,
picture varchar(500) not null default ''
);

CREATE table goodscomment (
id int not null PRIMARY KEY auto_increment,
userid int not null default 0,
goods_id int not null default 0,
score int not null default 0,
price_form varchar(100) not null default'',
shortcoming LONGTEXT not null default'',
virtues LONGTEXT not null default'',
general LONGTEXT not null default'',
comment_time datetime not null,
praise_count int not null default 0
);
CREATE table foruminfo(
id int PRIMARY KEY not null auto_increment,
title varchar(50) not null default'',
content LONGTEXT not null default'',
authorid int not null default 0,
publishtime datetime not null default '1900-01-01 01:01:01',
lastresponseid int not null default 0,
lastresponsetime datetime not null default '1900-01-01 01:01:01',
viewcount int not null default 0,
responsecount int not null default 0,
posttype varchar(10) not null default''
);
create table responsepostinfo(
id int not null PRIMARY key auto_increment,
postid int not null default 0,
responseuserid int not null default 0,
responsetime datetime not null default '1900-01-01 01:01:01',
responsecontent LONGTEXT not null default''
);
CREATE table article_praiseinfo(
id int not null PRIMARY key auto_increment,
userid int not null default 0,
type int not null DEFAULT 0,
articleid int not null default 0
);
CREATE table article_transmitinfo(
id int PRIMARY key not null auto_increment,
user_id int not null default 0,
guide VARCHAR(1000) not null default '',
article_id int not null default 0,
createtime datetime not null default '1990-01-01'

);
CREATE table article_commentinfo(
id int not null primary KEY auto_increment,
user_id int not null default 0,
article_id int not null default 0,
createtime datetime not null default '1990-01-01',
content varchar(500) not null default ''
);
CREATE table answer_praiseinfo(
id int not null PRIMARY key auto_increment,
userid int not null default 0,
answerid int not null DEFAULT 0
);
alter table foruminfo add column topic_markdown_content longtext not null default "";
alter table foruminfo add column topic_html_content longtext not null default "";

CREATE table question_browsecount(
id int not null PRIMARY key auto_increment,
userid int not null default 0,
questionid int not null DEFAULT 0
);