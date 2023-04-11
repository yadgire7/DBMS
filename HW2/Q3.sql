
-- software: MySQL Workbench (MySQL Server 8.0)
-- Query 3
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







-- Q3. Find unique user/s with the total number of paid subscribers 
-- greater than 100 for their channel/s created on 01.01.2023. Display the username, email, 
-- channel name and the subscriber count.

INSERT INTO subscription (user_id, channel_id, sub_type)
SELECT u.user_id, c.channel_name, 1
FROM users u
CROSS JOIN channel c
WHERE u.user_id NOT IN (4, 5, 6, 7)
AND c.channel_name IN ('Channel1', 'Channel2', 'Channel3', 'Channel4', 'Channel5', 'Channel6', 'Channel7', 'Channel8', 'Channel9', 'Channel10', 'Channel11')
ORDER BY RAND()
LIMIT 110;

INSERT INTO users (user_id, user_name, email, age, address, is_creator)
VALUES
(120, 'user120', 'user120@email.com', 26, 'street120, LA, US', false),
(121, 'user121', 'user121@email.com', 26, 'street121, LA, US', false),
(122, 'user122', 'user122@email.com', 26, 'street122, LA, US', false),
(123, 'user123', 'user123@email.com', 26, 'street123, LA, US', false),
(124, 'user124', 'user124@email.com', 26, 'street124, LA, US', false),
(125, 'user125', 'user125@email.com', 26, 'street125, LA, US', false),
(126, 'user126', 'user126@email.com', 26, 'street126, LA, US', false),
(127, 'user127', 'user127@email.com', 26, 'street127, LA, US', false),
(128, 'user128', 'user128@email.com', 26, 'street128, LA, US', false),
(129, 'user129', 'user129@email.com', 26, 'street129, LA, US', false),
(130, 'user130', 'user130@email.com', 26, 'street130, LA, US', false),
(131, 'user131', 'user131@email.com', 26, 'street131, LA, US', false),
(132, 'user132', 'user132@email.com', 26, 'street132, LA, US', false),
(133, 'user133', 'user133@email.com', 26, 'street133, LA, US', false),
(134, 'user134', 'user134@email.com', 26, 'street134, LA, US', false),
(135, 'user135', 'user135@email.com', 26, 'street135, LA, US', false),
(136, 'user136', 'user136@email.com', 26, 'street136, LA, US', false),
(137, 'user137', 'user137@email.com', 26, 'street137, LA, US', false),
(138, 'user138', 'user138@email.com', 26, 'street138, LA, US', false),
(139, 'user139', 'user139@email.com', 26, 'street139, LA, US', false),
(140, 'user140', 'user140@email.com', 26, 'street140, LA, US', false),
(141, 'user141', 'user141@email.com', 26, 'street141, LA, US', false),
(142, 'user142', 'user142@email.com', 26, 'street142, LA, US', false),
(143, 'user143', 'user143@email.com', 26, 'street143, LA, US', false),
(144, 'user144', 'user144@email.com', 26, 'street144, LA, US', false),
(145, 'user145', 'user145@email.com', 26, 'street145, LA, US', false),
(146, 'user146', 'user146@email.com', 26, 'street146, LA, US', false),
(147, 'user147', 'user147@email.com', 26, 'street147, LA, US', false),
(148, 'user148', 'user148@email.com', 26, 'street148, LA, US', false),
(149, 'user149', 'user149@email.com', 26, 'street149, LA, US', false),
(150, 'user150', 'user150@email.com', 26, 'street150, LA, US', false),
(151, 'user151', 'user151@email.com', 26, 'street151, LA, US', false),
(152, 'user152', 'user152@email.com', 26, 'street152, LA, US', false),
(153, 'user153', 'user153@email.com', 26, 'street153, LA, US', false),
(154, 'user154', 'user154@email.com', 26, 'street154, LA, US', false),
(155, 'user155', 'user155@email.com', 26, 'street155, LA, US', false),
(156, 'user156', 'user156@email.com', 26, 'street156, LA, US', false),
(157, 'user157', 'user157@email.com', 26, 'street157, LA, US', false),
(158, 'user158', 'user158@email.com', 26, 'street158, LA, US', false),
(159, 'user159', 'user159@email.com', 26, 'street159, LA, US', false),
(160, 'user160', 'user160@email.com', 26, 'street160, LA, US', false),
(161, 'user161', 'user161@email.com', 26, 'street161, LA, US', false),
(162, 'user162', 'user162@email.com', 26, 'street162, LA, US', false),
(163, 'user163', 'user163@email.com', 26, 'street163, LA, US', false),
(164, 'user164', 'user164@email.com', 26, 'street164, LA, US', false),
(165, 'user165', 'user165@email.com', 26, 'street165, LA, US', false),
(166, 'user166', 'user166@email.com', 26, 'street166, LA, US', false),
(167, 'user167', 'user167@email.com', 26, 'street167, LA, US', false),
(168, 'user168', 'user168@email.com', 26, 'street168, LA, US', false),
(169, 'user169', 'user169@email.com', 26, 'street169, LA, US', false),
(170, 'user170', 'user170@email.com', 26, 'street170, LA, US', false),
(171, 'user171', 'user171@email.com', 26, 'street171, LA, US', false),
(172, 'user172', 'user172@email.com', 26, 'street172, LA, US', false),
(173, 'user173', 'user173@email.com', 26, 'street173, LA, US', false),
(174, 'user174', 'user174@email.com', 26, 'street174, LA, US', false),
(175, 'user175', 'user175@email.com', 26, 'street175, LA, US', false),
(176, 'user176', 'user176@email.com', 26, 'street176, LA, US', false),
(177, 'user177', 'user177@email.com', 26, 'street177, LA, US', false),
(178, 'user178', 'user178@email.com', 26, 'street178, LA, US', false),
(179, 'user179', 'user179@email.com', 26, 'street179, LA, US', false),
(180, 'user180', 'user180@email.com', 26, 'street180, LA, US', false),
(181, 'user181', 'user181@email.com', 26, 'street181, LA, US', false),
(182, 'user182', 'user182@email.com', 26, 'street182, LA, US', false),
(183, 'user183', 'user183@email.com', 26, 'street183, LA, US', false),
(184, 'user184', 'user184@email.com', 26, 'street184, LA, US', false),
(185, 'user185', 'user185@email.com', 26, 'street185, LA, US', false),
(186, 'user186', 'user186@email.com', 26, 'street186, LA, US', false),
(187, 'user187', 'user187@email.com', 26, 'street187, LA, US', false),
(188, 'user188', 'user188@email.com', 26, 'street188, LA, US', false),
(189, 'user189', 'user189@email.com', 26, 'street189, LA, US', false),
(190, 'user190', 'user190@email.com', 26, 'street190, LA, US', false),
(191, 'user191', 'user191@email.com', 26, 'street191, LA, US', false),
(192, 'user192', 'user192@email.com', 26, 'street192, LA, US', false),
(193, 'user193', 'user193@email.com', 26, 'street193, LA, US', false),
(194, 'user194', 'user194@email.com', 26, 'street194, LA, US', false),
(195, 'user195', 'user195@email.com', 26, 'street195, LA, US', false),
(196, 'user196', 'user196@email.com', 26, 'street196, LA, US', false),
(197, 'user197', 'user197@email.com', 26, 'street197, LA, US', false),
(198, 'user198', 'user198@email.com', 26, 'street198, LA, US', false),
(199, 'user199', 'user199@email.com', 26, 'street199, LA, US', false),
(200, 'user200', 'user200@email.com', 26, 'street200, LA, US', false),
(201, 'user201', 'user201@email.com', 26, 'street201, LA, US', false),
(202, 'user202', 'user202@email.com', 26, 'street202, LA, US', false),
(203, 'user203', 'user203@email.com', 26, 'street203, LA, US', false),
(204, 'user204', 'user204@email.com', 26, 'street204, LA, US', false),
(205, 'user205', 'user205@email.com', 26, 'street205, LA, US', false),
(206, 'user206', 'user206@email.com', 26, 'street206, LA, US', false),
(207, 'user207', 'user207@email.com', 26, 'street207, LA, US', false),
(208, 'user208', 'user208@email.com', 26, 'street208, LA, US', false),
(209, 'user209', 'user209@email.com', 26, 'street209, LA, US', false),
(210, 'user210', 'user210@email.com', 26, 'street210, LA, US', false),
(211, 'user211', 'user211@email.com', 26, 'street211, LA, US', false),
(212, 'user212', 'user212@email.com', 26, 'street212, LA, US', false),
(213, 'user213', 'user213@email.com', 26, 'street213, LA, US', false),
(214, 'user214', 'user214@email.com', 26, 'street214, LA, US', false),
(215, 'user215', 'user215@email.com', 26, 'street215, LA, US', false),
(216, 'user216', 'user216@email.com', 26, 'street216, LA, US', false),
(217, 'user217', 'user217@email.com', 26, 'street217, LA, US', false),
(218, 'user218', 'user218@email.com', 26, 'street218, LA, US', false),
(219, 'user219', 'user219@email.com', 26, 'street219, LA, US', false),
(220, 'user220', 'user220@email.com', 26, 'street220, LA, US', false),
(221, 'user221', 'user221@email.com', 26, 'street221, LA, US', false),
(222, 'user222', 'user222@email.com', 26, 'street222, LA, US', false),
(223, 'user223', 'user223@email.com', 26, 'street223, LA, US', false),
(224, 'user224', 'user224@email.com', 26, 'street224, LA, US', false),
(225, 'user225', 'user225@email.com', 26, 'street225, LA, US', false),
(226, 'user226', 'user226@email.com', 26, 'street226, LA, US', false),
(227, 'user227', 'user227@email.com', 26, 'street227, LA, US', false),
(228, 'user228', 'user228@email.com', 26, 'street228, LA, US', false),
(229, 'user229', 'user229@email.com', 26, 'street229, LA, US', false),
(230, 'user230', 'user230@email.com', 26, 'street230, LA, US', false),
(231, 'user231', 'user231@email.com', 26, 'street231, LA, US', false),
(232, 'user232', 'user232@email.com', 26, 'street232, LA, US', false),
(233, 'user233', 'user233@email.com', 26, 'street233, LA, US', false),
(234, 'user234', 'user234@email.com', 26, 'street234, LA, US', false),
(235, 'user235', 'user235@email.com', 26, 'street235, LA, US', false),
(236, 'user236', 'user236@email.com', 26, 'street236, LA, US', false),
(237, 'user237', 'user237@email.com', 26, 'street237, LA, US', false),
(238, 'user238', 'user238@email.com', 26, 'street238, LA, US', false),
(239, 'user239', 'user239@email.com', 26, 'street239, LA, US', false);

INSERT INTO subscription (user_id, channel_id, sub_type)
VALUES
(120,'Channel4', 1),
(121,'Channel4', 1),
(122,'Channel4', 1),
(123,'Channel4', 1),
(124,'Channel4', 1),
(125,'Channel4', 1),
(126,'Channel4', 1),
(127,'Channel4', 1),
(128,'Channel4', 1),
(129,'Channel4', 1),
(130,'Channel4', 1),
(131,'Channel4', 1),
(132,'Channel4', 1),
(133,'Channel4', 1),
(134,'Channel4', 1),
(135,'Channel4', 1),
(136,'Channel4', 1),
(137,'Channel4', 1),
(138,'Channel4', 1),
(139,'Channel4', 1),
(140,'Channel4', 1),
(141,'Channel4', 1),
(142,'Channel4', 1),
(143,'Channel4', 1),
(144,'Channel4', 1),
(145,'Channel4', 1),
(146,'Channel4', 1),
(147,'Channel4', 1),
(148,'Channel4', 1),
(149,'Channel4', 1),
(150,'Channel4', 1),
(151,'Channel4', 1),
(152,'Channel4', 1),
(153,'Channel4', 1),
(154,'Channel4', 1),
(155,'Channel4', 1),
(156,'Channel4', 1),
(157,'Channel4', 1),
(158,'Channel4', 1),
(159,'Channel4', 1),
(160,'Channel4', 1),
(161,'Channel4', 1),
(162,'Channel4', 1),
(163,'Channel4', 1),
(164,'Channel4', 1),
(165,'Channel4', 1),
(166,'Channel4', 1),
(167,'Channel4', 1),
(168,'Channel4', 1),
(169,'Channel4', 1),
(170,'Channel4', 1),
(171,'Channel4', 1),
(172,'Channel4', 1),
(173,'Channel4', 1),
(174,'Channel4', 1),
(175,'Channel4', 1),
(176,'Channel4', 1),
(177,'Channel4', 1),
(178,'Channel4', 1),
(179,'Channel4', 1),
(180,'Channel4', 1),
(181,'Channel4', 1),
(182,'Channel4', 1),
(183,'Channel4', 1),
(184,'Channel4', 1),
(185,'Channel4', 1),
(186,'Channel4', 1),
(187,'Channel4', 1),
(188,'Channel4', 1),
(189,'Channel4', 1),
(190,'Channel4', 1),
(191,'Channel4', 1),
(192,'Channel4', 1),
(193,'Channel4', 1),
(194,'Channel4', 1),
(195,'Channel4', 1),
(196,'Channel4', 1),
(197,'Channel4', 1),
(198,'Channel4', 1),
(199,'Channel4', 1),
(200,'Channel4', 1),
(201,'Channel4', 1),
(202,'Channel4', 1),
(203,'Channel4', 1),
(204,'Channel4', 1),
(205,'Channel4', 1),
(206,'Channel4', 1),
(207,'Channel4', 1),
(208,'Channel4', 1),
(209,'Channel4', 1),
(210,'Channel4', 1),
(211,'Channel4', 1),
(212,'Channel4', 1),
(213,'Channel4', 1),
(214,'Channel4', 1),
(215,'Channel4', 1),
(216,'Channel4', 1),
(217,'Channel4', 1),
(218,'Channel4', 1),
(219,'Channel4', 1),
(220,'Channel4', 1),
(221,'Channel4', 1),
(222,'Channel4', 1),
(223,'Channel4', 1),
(224,'Channel4', 1),
(225,'Channel4', 1),
(226,'Channel4', 1),
(227,'Channel4', 1),
(228,'Channel4', 1),
(229,'Channel4', 1),
(230,'Channel4', 1),
(231,'Channel4', 1),
(232,'Channel4', 1),
(233,'Channel4', 1),
(234,'Channel4', 1),
(235,'Channel4', 1),
(236,'Channel4', 1),
(237,'Channel4', 1),
(238,'Channel4', 1),
(239,'Channel4', 1);

UPDATE channel SET date_created = '2023-01-01' WHERE channel_name IN ('Channel4', 'Channel5', 'Channel6');

/*/////////////////////////////////////////////////////////////////////////*/

INSERT INTO information_video (video_url, keyword)
SELECT url, SUBSTRING_INDEX(description, ' ', -1) AS keyword
FROM video
where category = 'educational'
;
/*//////////////////////////////////////////////////////////////////////////*/

-- **************************************************************************
with abc as (
select * from channel a
join subscription b
on a.channel_name = b.channel_id
where a.date_created = '2023-01-01' and b.sub_type = 1
),
def as (
select channel_name, owner_id, sub_count, count(user_id) as paid_sub_count
from abc
group by 1,2,3
having paid_sub_count>100
)
select user_name, email, channel_name, sub_count from users a
join def b
on a.user_id = b.owner_id
;
-- ***************************************************************************

-- result
/*
Bruce Banner - Marvel Entertainment	bruce.banner@example.com	Channel4	750
*/