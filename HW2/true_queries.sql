show databases;

create database youtube;
use youtube;
/* user table*/
create table user (
user_id int(10) primary key not null,
user_name varchar(50) not null,
email varchar(80) not null,
age int(3) not null,
address varchar(100) not null
);

alter table user 
add column is_creator bool not null,
add column is_consumer bool not null;

alter table user 
drop column is_consumer;

/* channel table*/

create table channel (
channel_name varchar(50) primary key not null,
owner_id int(10) not null,
sub_count int(10) not null,
date_created date not null
);

alter table channel
add constraint fk_owner_id foreign key(owner_id) references user(user_id);

/* video table*/

create table video (
url varchar(100) primary key not null,
title varchar(100) not null,
thumbnail blob,
category varchar(10),
duration_in_sec int(10),
description varchar(200),
upload_id int(10) not null,
upload_date date,
upload_time time,
channel_id varchar(50) not null,
constraint fk_upload_id foreign key(upload_id) references channel(owner_id),
constraint fk_channel_id foreign key(channel_id) references channel(channel_name)
);

/* subscription table*/

create table subscription (
user_id int(10) not null,
channel_id varchar(50) not null,
sub_type bool,
constraint fk_user_id foreign key(user_id) references user(user_id),
constraint fk_sub_channel_id foreign key(channel_id) references channel(channel_name)
);

/* information_video table */

create table information_video (
video_url varchar(100) not null,
keyword varchar(50) not null,
constraint fk_video_url foreign key(video_url) references video(url)
);

/* entertainment_video table*/

create table entertainment_video (
video_url varchar(100) not null,
tags varchar(100),
constraint fk_ent_video_url foreign key(video_url) references video(url)
);

/* statistics table */

create table statistics (
url varchar(100) primary key not null,
likes int(10) not null,
dislikes int(10) not null,
views int(10) not null,
shares int(10) not null,
comments int(10) not null,
constraint fk_url foreign key(url) references video(url)
);

/* comments table */
create table comments(
comment_id int(10) primary key not null,
video_url varchar(100) not null,
commenter_id int(10) not null,
likes int(10) not null,
comment_text varchar(200) not null,
sentiment float not null,
constraint fk_comment_video_url foreign key(video_url) references video(url),
constraint fk_commenter_id foreign key(commenter_id) references users(user_id)
);

/* sponsor table*/

create table sponsor (
sponsor_id int(10) primary key not null,
video_url varchar(100) not null,
sponsor_name varchar(50) not null,
address varchar(100),
phone int(10) not null,
sponsor_amount int not null,
constraint fk_sp_video_url foreign key(video_url) references video(url)
);

/*------------------------------------------*/
INSERT INTO sponsor (sponsor_id, video_url, sponsor_name, address, phone, sponsor_amount) 
VALUES
(1, 'https://www.youtube.com/watch?v=12345', 'Sponsor 1', '123 Main St', '555-555-5555', 1000),
(2, 'https://www.youtube.com/watch?v=67890', 'Sponsor 2', '456 Oak Ave', '555-555-5555', 500),
(3, 'https://www.youtube.com/watch?v=abcde', 'Sponsor 3', '789 Maple Ln', '555-555-5555', 250),
(4, 'https://www.youtube.com/watch?v=fghij', 'Sponsor 4', '321 Elm St', '555-555-5555', 1000),
(5, 'https://www.youtube.com/watch?v=klmno', 'Sponsor 5', '654 Cedar Ave', '555-555-5555', 500),
(6, 'https://www.youtube.com/watch?v=pqrst', 'Sponsor 6', '987 Pine St', '555-555-5555', 250),
(7, 'https://www.youtube.com/watch?v=uvwxy', 'Sponsor 7', '159 Oak Ln', '555-555-5555', 1000),
(8, 'https://www.youtube.com/watch?v=zabcd', 'Sponsor 8', '753 Maple St', '555-555-5555', 500),
(9, 'https://www.youtube.com/watch?v=efghi', 'Sponsor 9', '246 Cedar Ln', '555-555-5555', 250),
(10, 'https://www.youtube.com/watch?v=jklmn', 'Sponsor 10', '951 Pine Ave', '555-555-5555', 1000),
(11, 'https://www.youtube.com/watch?v=opqrs', 'Sponsor 11', '357 Elm Ln', '555-555-5555', 500),
(12, 'https://www.youtube.com/watch?v=tuvwx', 'Sponsor 12', '864 Oak St', '555-555-5555', 250),
(13, 'https://www.youtube.com/watch?v=yzabc', 'Sponsor 13', '258 Maple Ave', '555-555-5555', 1000),
(14, 'https://www.youtube.com/watch?v=defgh', 'Sponsor 14', '753 Cedar St', '555-555-5555', 500),
(15, 'https://www.youtube.com/watch?v=ijklm', 'Sponsor 15', '159 Pine Ln', '555-555-5555', 250),
(16, 'https://www.youtube.com/watch?v=nopqr', 'Sponsor 16', '246 Oak Ave', '555-555-5555', 1000),
(17, 'https://www.youtube.com/watch?v=stuvw', 'Sponsor 17', '951 Maple Ln', '555-555-5555', 500),
(18, 'https://www.youtube.com/watch?v=xyzab', 'Sponsor 18', '357 Cedar St', '555-555-5555', 250)




