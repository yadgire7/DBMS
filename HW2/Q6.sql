-- software: MySQL Workbench (MySQL Server 8.0)
-- DML statements for manipulating the dates in order to get video in every week were added and are similar to below DML statement
-- create database youtube;
-- use youtube;
-- /* user table*/
-- create table user (
-- user_id int(10) primary key not null,
-- user_name varchar(50) not null,
-- email varchar(80) not null,
-- age int(3) not null,
-- address varchar(100) not null
-- );

-- alter table user 
-- add column is_creator bool not null,
-- add column is_consumer bool not null;

-- alter table user 
-- drop column is_consumer;

-- /* channel table*/

-- create table channel (
-- channel_name varchar(50) primary key not null,
-- owner_id int(10) not null,
-- sub_count int(10) not null,
-- date_created date not null
-- );

-- alter table channel
-- add constraint fk_owner_id foreign key(owner_id) references user(user_id);

-- /* video table*/

-- create table video (
-- url varchar(100) primary key not null,
-- title varchar(100) not null,
-- thumbnail blob,
-- category varchar(10),
-- duration_in_sec int(10),
-- description varchar(200),
-- upload_id int(10) not null,
-- upload_date date,
-- upload_time time,
-- channel_id varchar(50) not null,
-- constraint fk_upload_id foreign key(upload_id) references channel(owner_id),
-- constraint fk_channel_id foreign key(channel_id) references channel(channel_name)
-- );

-- /* subscription table*/

-- create table subscription (
-- user_id int(10) not null,
-- channel_id varchar(50) not null,
-- sub_type bool,
-- constraint fk_user_id foreign key(user_id) references user(user_id),
-- constraint fk_sub_channel_id foreign key(channel_id) references channel(channel_name)
-- );

-- /* information_video table */

-- create table information_video (
-- video_url varchar(100) not null,
-- keyword varchar(50) not null,
-- constraint fk_video_url foreign key(video_url) references video(url)
-- );

-- /* entertainment_video table*/

-- create table entertainment_video (
-- video_url varchar(100) not null,
-- tags varchar(100),
-- constraint fk_ent_video_url foreign key(video_url) references video(url)
-- );

-- /* statistics table */

-- create table statistics (
-- url varchar(100) primary key not null,
-- likes int(10) not null,
-- dislikes int(10) not null,
-- views int(10) not null,
-- shares int(10) not null,
-- comments int(10) not null,
-- constraint fk_url foreign key(url) references video(url)
-- );

-- /* comments table */
-- create table comments(
-- comment_id int(10) primary key not null,
-- video_url varchar(100) not null,
-- commenter_id int(10) not null,
-- likes int(10) not null,
-- comment_text varchar(200) not null,
-- sentiment float not null,
-- constraint fk_comment_video_url foreign key(video_url) references video(url),
-- constraint fk_commenter_id foreign key(commenter_id) references users(user_id)
-- );

-- /* sponsor table*/

-- create table sponsor (
-- sponsor_id int(10) primary key not null,
-- video_url varchar(100) not null,
-- sponsor_name varchar(50) not null,
-- address varchar(100),
-- phone int(10) not null,
-- sponsor_amount int not null,
-- constraint fk_sp_video_url foreign key(video_url) references video(url)
-- );
-- ////////////////////////////////////////////////////////////////////////////////////

-- Q6. Find all the content creators living in the US who have consistently 
-- posted at least 1 video each week of the last month. Display their username, channel/s they own and their 
-- total subscriber count.

-- **********************************************************************************
update video
set upload_date = '2023-01-26'
where description = 'Learn how to sing';


with abc as (
select distinct a.owner_id, a.channel_name, a.sub_count from channel a
join video b
on a.owner_id = b.upload_id 
where (year(b.upload_date) = year(curdate()) and month(b.upload_date) = month(curdate()) - 1) or (year(b.upload_date)- year(curdate() = 1 and month(b.upload_date) - month(curdate()) = 11))
group by 1,2
having count(distinct week(b.upload_date))>=4
)
select a.owner_id, a.channel_name, a.sub_count from abc a
join users u
on a.owner_id = u.user_id
where u.address like '%US%'
;
-- ************************************************************************************

-- 

-- result
/*
4	Channel1	500
4	Channel13	750
4	Channel17	150
4	Channel5	100
4	Channel9	200
/*