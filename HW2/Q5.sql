-- software: MySQL Workbench (MySQL Server 8.0)

-- Q5. Find the minimum and maximum age of viewers who 
-- watched the most commented on video on Taylor Swift’s channel. 
-- Display the video title, minimum age and the maximum age.

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

-- some DML statements to modify the data in table
-- select * from statistics
--  where comments = (select max(comments) from statistics);
--  use youtube;
--  select * from video where url = 'https://www.youtube.com/watch?v=MNO345';
--  select * from users
--  where user_id = 4;
 
--  update video
--  set upload_id = 4
--  where url = 'https://www.youtube.com/watch?v=MNO345'
--  ;
-- -- ////////////////////////////////////////////////////////////////
--  update users
--  set user_name = 'Taylor Swift' 
--  where user_id = 4;

 -- //////////////////////////////////////////////////////////////////
 
 create table viewers (
 video_url varchar(100) not null,
 viewer_id int(10) not null,
 constraint fk_v_url foreign key(video_url) references video(url),
 constraint fk_v_user_id foreign key(viewer_id) references users(user_id)
 );
 
 
 -- ///////////////////////////////////////////////////////////////////
 
 INSERT INTO viewers (video_url, viewer_id)
SELECT v.url, u.user_id
FROM video v
CROSS JOIN users u
WHERE u.user_id NOT IN (4, 5, 6, 7)
ORDER BY RAND()
LIMIT 110;
 
 -- //////////////////////////////////////////////////////////////////////
 
-- select * from users; 
-- ****************************************************************************
with abc as(
select distinct u.user_id, u.user_name, v.url, v.title, w.comments, x.viewer_id from users u
join video v
on u.user_id = v.upload_id
join statistics w
on v.url = w.url and u.user_name like '%Taylor Swift%'
join viewers x
on w.url = x.video_url
where w.comments = (select max(comments) from statistics)
),
def as (
select u.user_id, u.age, v.url, v.title from users u
join abc v
on u.user_id = v.viewer_id
)
select title, min(age) as min_age, max(age) as max_age 
from def
group by url
;
-- **************************************************************************

-- with clause has been used to create temporary tables and extract the required columns from them
-- abc contains Tailor Swift's videos and the number of comments on each of the video
-- def contains list of users (who have viewed Tailor Swift's most commented video) and their age 
-- finally get min(age) max(age for the user for the most commented video

-- result
/*
Introduction to Computer Science	23	40
*/
 