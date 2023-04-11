
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


-- Q2. Find the ratio of likes to views of each video belonging to any of the channels owned by users 
-- having the word “Marvel Entertainment” in them. Display the Video Title, channel name and the  
-- ratio in the ascending order of the title.
-- //////////////////////////////////////////////////////////////////////////////////// 
INSERT INTO video (url, title, thumbnail, category, duration_in_sec, description, upload_id, upload_date, upload_time, channel_id)
VALUES
('https://www.youtube.com/watch?v=ABC123', 'Introduction to Calculus', NULL, 'educational', 3600, 'Learn the basics of calculus', 4, '2022-01-01', '12:00:00', 'Channel1'),
('https://www.youtube.com/watch?v=DEF456', 'Funny Cat Videos', NULL, 'entertainment', 180, 'Watch these hilarious cats', 5, '2022-01-02', '15:30:00', 'Channel10'),
('https://www.youtube.com/watch?v=GHI789', 'The History of Rome', NULL, 'educational', 7200, 'A comprehensive overview of ancient Rome', 4, '2022-01-03', '10:00:00', 'Channel1'),
('https://www.youtube.com/watch?v=JKL012', 'Cooking with Jamie Oliver', NULL, 'entertainment', 2400, 'Learn how to make delicious meals', 6, '2022-01-04', '18:00:00', 'Channel11'),
('https://www.youtube.com/watch?v=MNO345', 'Introduction to Computer Science', NULL, 'educational', 5400, 'Learn the basics of programming', 5, '2022-01-05', '09:00:00', 'Channel10'),
('https://www.youtube.com/watch?v=PQR678', 'Cute Puppy Compilation', NULL, 'entertainment', 120, 'Watch these adorable puppies', 7, '2022-01-06', '14:00:00', 'Channel12'),
('https://www.youtube.com/watch?v=STU901', 'Chemistry Experiments', NULL, 'educational', 4800, 'Learn about chemical reactions', 7, '2022-01-07', '16:00:00', 'Channel16'),
('https://www.youtube.com/watch?v=UVW234', 'Singing Lessons for Beginners', NULL, 'educational', 3600, 'Learn how to sing', 4, '2022-01-08', '11:00:00', 'Channel13'),
('https://www.youtube.com/watch?v=XYZ567', 'Funny Dog Videos', NULL, 'entertainment', 180, 'Watch these hilarious dogs', 6, '2022-01-09', '13:30:00', 'Channel11'),
('https://www.youtube.com/watch?v=JKL901', 'Introduction to Biology', NULL, 'educational', 5400, 'Learn the basics of biology', 5, '2022-01-10', '09:30:00', 'Channel14'),
('https://www.youtube.com/watch?v=PQR234', 'Travel Vlog: Paris', NULL, 'entertainment', 1800, 'Join us on our trip to Paris', 7, '2022-01-11', '12:00:00', 'Channel20'),
('https://www.youtube.com/watch?v=DEF789', 'Gardening Tips', NULL, 'educational', 3600, 'Learn how to grow your own vegetables', 4, '2022-01-12', '10:00:00', 'Channel17');
-- /////////////////////////////////////////////////////////////////////////////////////

INSERT INTO statistics (url, likes, dislikes, views, shares, comments) VALUES 
('https://www.youtube.com/watch?v=ABC123', 50, 5, 15000, 200, 10),
('https://www.youtube.com/watch?v=DEF456', 100, 2, 8000, 150, 5),
('https://www.youtube.com/watch?v=GHI789', 30, 1, 5000, 50, 2),
('https://www.youtube.com/watch?v=JKL012', 70, 3, 2000, 100, 8),
('https://www.youtube.com/watch?v=MNO345', 200, 10, 10000, 300, 15),
('https://www.youtube.com/watch?v=PQR678', 40, 2, 5000, 80, 5),
('https://www.youtube.com/watch?v=STU901', 80, 4, 3000, 120, 10),
('https://www.youtube.com/watch?v=UVW234', 25, 2, 4000, 50, 3),
('https://www.youtube.com/watch?v=XYZ567', 60, 5, 7000, 90, 6),
('https://www.youtube.com/watch?v=JKL901', 60, 5, 7000, 90, 6),
('https://www.youtube.com/watch?v=PQR234', 60, 5, 7000, 90, 6),
('https://www.youtube.com/watch?v=DEF789', 60, 5, 7000, 90, 6);

/*///////////////////////////////////////////////////////////////////*/ 
 
-- ****************************************************************************
with abc as (
select user_id, channel_name from users a
join channel b
on a.user_id = b.owner_id
where a.user_name like '%Marvel Entertainment%'
),
def as(
select a.channel_name as channel_name, b.url as url, b.title as title from abc a
join video b
on a.channel_name = b.channel_id
),
ghi as(
select channel_name, a.url, a.title, b.likes, b.views from def a
join statistics b
on a.url = b.url
group by channel_name, url
)
select title, channel_name, likes / views as ratio 
from ghi
order by ratio;
-- *****************************************************************************

-- result
/*
Cute Puppy Compilation	Channel12	0.0080
Introduction to Biology	Channel14	0.0086
Travel Vlog: Paris	Channel20	0.0086
Funny Dog Videos	Channel11	0.0086
Funny Cat Videos	Channel10	0.0125
Introduction to Computer Science	Channel10	0.0200
Chemistry Experiments	Channel16	0.0267
Cooking with Jamie Oliver	Channel11	0.0350
*/

-- approach
-- The query is executed using sub queries. 
-- I have used the step-by-step approach for this query (can be called as backtracking)
-- the ratio can be accessed using statistics-> which has a one to one relation with video(i.e every video has its(1) statistics record)
-- every video comes from channel table (video.upload_id = channel.owner.id)
-- and finally every content creator is a user(user.user_id = channel.owner_id)alter
-- other conditions a re handled using where clause

