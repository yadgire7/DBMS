-- software: MySQL Workbench (MySQL Server 8.0)
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


-- Q2. Find the ratio of likes to views of each video belonging to any of the channels 
-- owned by users having the word “Marvel Entertainment” in them. 
-- Display the Video Title, channel name and the ratio in the ascending order of the title.

-- ******************************************************************************
select  v.title, v.channel_id, s.likes / s.views as ratio
from video v
join statistics s
on v.url = s.url
join users u on
v.upload_id = u.user_id
where u.user_name in 
(select user_name from users
where user_name like '%Marvel Entertainment%'
)
order by ratio
;
-- ******************************************************************************

-- this approch uses multiple joins in a single select statement
-- along with handling the condition of 'name contains Marvel Entertainment' 
-- by using a subquery with where clause

-- result

/*
Cute Puppy Compilation	Channel12	0.0080
Introduction to Biology	Channel14	0.0086
Travel Vlog: Paris	Channel20	0.0086
Funny Dog Videos	Channel11	0.0086
Funny Cat Videos	Channel10	0.0125
Chemistry Experiments	Channel16	0.0267
Cooking with Jamie Oliver	Channel11	0.0350
*/