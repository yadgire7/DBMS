RENAME TABLE user TO users;
use youtube;
INSERT INTO users (user_id, user_name, email, age, address, is_creator)
VALUES
  (1, 'John Doe', 'john.doe@example.com', 30, '123 Main St, Anytown USA', false),
  (2, 'Jane Smith', 'jane.smith@example.com', 25, '456 Oak Ave, Anytown USA', false),
  (3, 'Bob Johnson', 'bob.johnson@example.com', 40, '789 Elm St, Anytown USA', false),
  (4, 'Alice Lee', 'alice.lee@example.com', 35, '321 Maple St, Anytown USA', true),
  (5, 'Peter Parker - Marvel Entertainment', 'peter.parker@example.com', 28, 'New York City, NY', true),
  (6, 'Tony Stark - Marvel Entertainment', 'tony.stark@example.com', 45, 'Malibu, CA', true),
  (7, 'Bruce Banner - Marvel Entertainment', 'bruce.banner@example.com', 42, 'New York City, NY', true),
  (8, 'Clark Kent', 'clark.kent@example.com', 33, 'Metropolis, USA', false),
  (9, 'Bruce Wayne', 'bruce.wayne@example.com', 40, 'Gotham City, USA', false),
  (10, 'Diana Prince', 'diana.prince@example.com', 28, 'Themyscira, Greece', false),
  (11, 'Steve Rogers', 'steve.rogers@example.com', 97, 'Brooklyn, NY', false),
  (12, 'Natasha Romanoff', 'natasha.romanoff@example.com', 36, 'St. Petersburg, Russia', false),
  (13, 'Wade Wilson', 'wade.wilson@example.com', 32, 'New York City, NY', false),
  (14, 'Scott Lang', 'scott.lang@example.com', 40, 'San Francisco, CA', false),
  (15, 'T\'Challa', 'tchalla@example.com', 40, 'Wakanda, Africa', false),
  (16, 'Ororo Munroe', 'ororo.munroe@example.com', 35, 'Kenya, Africa', false),
  (17, 'Vision', 'vision@example.com', 3, 'Avengers HQ, NY', false),
  (18, 'Sam Wilson', 'sam.wilson@example.com', 36, 'Washington, D.C.', false),
  (19, 'Gamora', 'gamora@example.com', 30, 'Zehoberei, Outer Space', false),
  (20, 'Groot', 'groot@example.com', 8, 'Knowhere, Outer Space', false),
  (21, 'Rocket Raccoon', 'rocket.raccoon@example.com', 6, 'Knowhere, Outer Space', false);
  
  select user_id, user_name from users 
  where is_creator = true;
  
  /*//////////////////////////////////////////////////////////*/
  
INSERT INTO channel (channel_name, owner_id, sub_count, date_created) VALUES
('Channel1', 4, 500, '2022-01-01'),
('Channel2', 5, 250, '2022-01-02'),
('Channel3', 6, 1000, '2022-01-03'),
('Channel4', 7, 750, '2022-01-04'),
('Channel5', 4, 100, '2022-01-05'),
('Channel6', 5, 50, '2022-01-06'),
('Channel7', 6, 0, '2022-01-07'),
('Channel8', 7, 300, '2022-01-08'),
('Channel9', 4, 200, '2022-01-09'),
('Channel10', 5, 0, '2022-01-10'),
('Channel11', 6, 100, '2022-01-11'),
('Channel12', 7, 500, '2022-01-12'),
('Channel13', 4, 750, '2022-01-01'),
('Channel14', 5, 200, '2022-01-02'),
('Channel15', 6, 100, '2022-01-03'),
('Channel16', 7, 1000, '2022-01-04'),
('Channel17', 4, 150, '2022-01-05'),
('Channel18', 5, 500, '2022-01-06'),
('Channel19', 6, 250, '2022-01-07'),
('Channel20', 7, 100, '2022-01-08');

/*/////////////////////////////////////////////////////////////*/

select channel_name from channel
where owner_id = 7;

alter table video
modify category varchar(20) not null;

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

/*////////////////////////////////////////////////////////////*/

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

select * from users;

INSERT INTO users (user_id, user_name, email, age, address, is_creator)
VALUES
(23, 'Jessica Jones', 'jessica.jones@example.com', 35, 'New York City, NY', false),
(24, 'Luke Cage', 'luke.cage@example.com', 40, 'Harlem, NY', false),
(25, 'Danny Rand', 'danny.rand@example.com', 33, 'New York City, NY', false),
(26, 'Matt Murdock', 'matt.murdock@example.com', 38, 'New York City, NY', false),
(27, 'Karen Page', 'karen.page@example.com', 30, 'New York City, NY', false),
(28, 'Foggy Nelson', 'foggy.nelson@example.com', 35, 'New York City, NY', false),
(29, 'Jessica Drew', 'jessica.drew@example.com', 32, 'London, UK', false),
(30, 'Carol Danvers', 'carol.danvers@example.com', 40, 'Boston, MA', false),
(31, 'Peggy Carter', 'peggy.carter@example.com', 98, 'London, UK', false),
(32, 'Sharon Carter', 'sharon.carter@example.com', 35, 'Washington, D.C.', false),
(33, 'Bucky Barnes', 'bucky.barnes@example.com', 105, 'Brooklyn, NY', false),
(34, 'Peter Quill', 'peter.quill@example.com', 40, 'Missouri, USA', false),
(35, 'Gamora', 'gamora2@example.com', 30, 'Zehoberei, Outer Space', false),
(36, 'Rocket Raccoon', 'rocket.raccoon2@example.com', 6, 'Knowhere, Outer Space', false),
(37, 'Drax', 'drax2@example.com', 44, 'Unknown, Outer Space', false),
(38, 'Mantis', 'mantis@example.com', 29, 'Unknown, Outer Space', false),
(39, 'Stephen Strange', 'stephen.strange@example.com', 42, 'Greenwich Village, NY', false),
(40, 'Wong', 'wong@example.com', 45, 'Kamar-Taj, Nepal', false),
(41, 'Peter Parker', 'peter.parker2@example.com', 28, 'New York City, NY', false),
(42, 'May Parker', 'may.parker@example.com', 70, 'Queens, NY', false),
(43, 'Miles Morales', 'miles.morales@example.com', 16, 'Brooklyn, NY', false),
(44, 'Jessica Drew', 'jessica.drew2@example.com', 32, 'London, UK', false),
(45, 'Gwen Stacy', 'gwen.stacy@example.com', 25, 'New York City, NY', false),
(46, 'Ben Reilly', 'ben.reilly@example.com', 30, 'New York City, NY', false),
(47, 'Anya Corazon', 'anya.corazon@example.com', 22, 'Brooklyn, NY', false),
(48, 'Miguel Hara', 'miguel.ohara@example.com', 28, 'New York City, NY',false),
  (49, 'Lucas Johnson', 'lucas.johnson@example.com', 25, '555 Cedar St, Anytown USA', false),
  (50, 'Olivia Garcia', 'olivia.garcia@example.com', 32, '888 Pine St, Anytown USA', false),
  (51, 'William Brown', 'william.brown@example.com', 40, '111 Maple Ave, Anytown USA', false),
  (52, 'Isabella Davis', 'isabella.davis@example.com', 28, '222 Oak St, Anytown USA', false),
  (53, 'James Rodriguez', 'james.rodriguez@example.com', 35, '333 Elm St, Anytown USA', false),
  (54, 'Sophia Hernandez', 'sophia.hernandez@example.com', 22, '444 Main St, Anytown USA', false),
  (55, 'Benjamin Martinez', 'benjamin.martinez@example.com', 47, '777 Oak Ave, Anytown USA', false),
  (56, 'Avery Wright', 'avery.wright@example.com', 19, '999 Elm St, Anytown USA', false),
  (57, 'Aria Hill', 'aria.hill@example.com', 26, '333 Maple St, Anytown USA', false),
  (58, 'Carter Torres', 'carter.torres@example.com', 38, '777 Main St, Anytown USA', false),
  (59, 'Evelyn Peterson', 'evelyn.peterson@example.com', 30, '111 Oak Ave, Anytown USA', false),
  (60, 'Michael Flores', 'michael.flores@example.com', 45, '555 Elm St, Anytown USA', false),
  (61, 'Abigail Reed', 'abigail.reed@example.com', 24, '888 Main St, Anytown USA', false),
  (62, 'Daniel Gonzalez', 'daniel.gonzalez@example.com', 29, '222 Maple Ave, Anytown USA', false),
  (63, 'Emily Carter', 'emily.carter@example.com', 27, '333 Oak St, Anytown USA', false),
  (64, 'Alexander Perez', 'alexander.perez@example.com', 34, '444 Elm St, Anytown USA', false),
  (65, 'Aaliyah Turner', 'aaliyah.turner@example.com', 23, '777 Main St, Anytown USA', false),
  (66, 'David Parker', 'david.parker@example.com', 42, '999 Pine St, Anytown USA', false),
  (67, 'Sofia Evans', 'sofia.evans@example.com', 31, '333 Cedar St, Anytown USA', false),
  (68, 'Mason Edwards', 'mason.edwards@example.com', 36, '777 Pine St, Anytown USA', false),
  (69, 'Chloe Collins', 'chloe.collins@example.com', 29, '111 Cedar St, Anytown USA', false),
  (70, 'Ethan Stewart', 'ethan.stewart@example.com', 33, '555 Pine St, Anytown USA', false),
  (71, 'Victoria Sanchez', 'victoria.sanchez@example.com', 28, '888 Cedar St, Anytown USA', false),
  (72, 'Emily Nguyen', 'emily.nguyen@example.com', 27, '123 Main St, Anytown USA', false),
  (73, 'Jacob Brown', 'jacob.brown@example.com', 31, '456 Oak Ave, Anytown USA', false),
  (74, 'Olivia Davis', 'olivia.davis@example.com', 42, '789 Elm St, Anytown USA', false),
  (75, 'Sophia Wilson', 'sophia.wilson@example.com', 36, '321 Maple St, Anytown USA', false),
  (76, 'Ethan Martinez', 'ethan.martinez@example.com', 29, 'New York City, NY', false),
  (77, 'Mia Thompson', 'mia.thompson@example.com', 39, 'Malibu, CA', false),
  (78, 'William Baker', 'william.baker@example.com', 33, 'New York City, NY', false),
  (79, 'Isabella Lee', 'isabella.lee@example.com', 26, 'Metropolis, USA', false),
  (80, 'Michael Wright', 'michael.wright@example.com', 47, 'Gotham City, USA', false),
  (81, 'Sophie Brown', 'sophie.brown@example.com', 32, 'Themyscira, Greece', false),
  (82, 'Daniel Garcia', 'daniel.garcia@example.com', 40, 'Brooklyn, NY', false),
  (83, 'Ava Hernandez', 'ava.hernandez@example.com', 28, 'St. Petersburg, Russia', false),
  (84, 'Alexander Lopez', 'alexander.lopez@example.com', 35, 'New York City, NY', false),
  (85, 'Madison Green', 'madison.green@example.com', 40, 'San Francisco, CA', false),
  (86, 'Benjamin Perez', 'benjamin.perez@example.com', 31, 'Wakanda, Africa', false),
  (87, 'Sofia Torres', 'sofia.torres@example.com', 26, 'Kenya, Africa', false),
  (88, 'William Flores', 'william.flores@example.com', 6, 'Avengers HQ, NY', false),
  (89, 'Grace Adams', 'grace.adams@example.com', 33, 'Washington, D.C.', false),
  (90, 'Victoria Gutierrez', 'victoria.gutierrez@example.com', 41, 'Zehoberei, Outer Space', false),
  (91, 'Gabriel Mitchell', 'gabriel.mitchell@example.com', 20, 'Knowhere, Outer Space', false),
  (92, 'Avery Carter', 'avery.carter@example.com', 42, 'Knowhere, Outer Space', false),
  (93, 'Scarlett Evans', 'scarlett.evans@example.com', 39, 'Unknown, Outer Space', false),
  (94, 'Ryan Adams', 'ryan.adams@example.com', 28, '123 Main St, Anytown USA', false),
  (95, 'Evelyn Campbell', 'evelyn.campbell@example.com', 36, '456 Oak Ave, Anytown USA', false),
   (96, 'Lucas Brown', 'lucas.brown@example.com', 28, '123 Main St, Anytown USA', false),
  (97, 'Olivia Davis', 'olivia.davis@example.com', 25, '456 Oak Ave, Anytown USA', false),
  (98, 'Sophia Rodriguez', 'sophia.rodriguez@example.com', 40, '789 Elm St, Anytown USA', false),
  (99, 'Alexander Perez', 'alexander.perez@example.com', 35, '321 Maple St, Anytown USA', false),
  (100, 'Emma Taylor', 'emma.taylor@example.com', 28, 'New York City, NY', false),
  (101, 'David Hernandez', 'david.hernandez@example.com', 45, 'Malibu, CA', false),
  (102, 'Isabella Moore', 'isabella.moore@example.com', 42, 'New York City, NY', false),
  (103, 'William Martin', 'william.martin@example.com', 33, 'Metropolis, USA', false),
  (104, 'Sofia Jackson', 'sofia.jackson@example.com', 40, 'Gotham City, USA', false),
  (105, 'Joseph Lee', 'joseph.lee@example.com', 28, 'Themyscira, Greece', false),
  (106, 'Victoria Perez', 'victoria.perez@example.com', 97, 'Brooklyn, NY', false),
  (107, 'Anthony Robinson', 'anthony.robinson@example.com', 36, 'St. Petersburg, Russia', false),
  (108, 'Elizabeth Hill', 'elizabeth.hill@example.com', 32, 'New York City, NY', false),
  (109, 'Christopher Turner', 'christopher.turner@example.com', 40, 'San Francisco, CA', false),
  (110, 'Natalie King', 'natalie.king@example.com', 40, 'Wakanda, Africa', false),
  (111, 'Kevin Campbell', 'kevin.campbell@example.com', 35, 'Kenya, Africa', false),
  (112, 'Aaliyah Mitchell', 'aaliyah.mitchell@example.com', 3, 'Avengers HQ, NY', false),
  (113, 'Ethan Carter', 'ethan.carter@example.com', 36, 'Washington, D.C.', false),
  (114, 'Chloe Perez', 'chloe.perez@example.com', 30, 'Zehoberei, Outer Space', false),
  (115, 'Avery Baker', 'avery.baker@example.com', 8, 'Knowhere, Outer Space', false);

/*///////////////////////////////////////////////*/

INSERT INTO subscription (user_id, channel_id, sub_type)
SELECT u.user_id, c.channel_name, 1
FROM users u
CROSS JOIN channel c
WHERE u.user_id NOT IN (4, 5, 6, 7)
AND c.channel_name IN ('Channel1', 'Channel2', 'Channel3', 'Channel4', 'Channel5', 'Channel6', 'Channel7', 'Channel8', 'Channel9', 'Channel10', 'Channel11')
ORDER BY RAND()
LIMIT 110;

select * from subscription;

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

/*//////////////////////////////////////////////////////////////////////*/
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

select * from channel;

UPDATE channel SET date_created = '2023-01-01' WHERE channel_name IN ('Channel4', 'Channel5', 'Channel6');

/*/////////////////////////////////////////////////////////////////////////*/

INSERT INTO information_video (video_url, keyword)
SELECT url, SUBSTRING_INDEX(description, ' ', -1) AS keyword
FROM video
where category = 'educational'
;
/*//////////////////////////////////////////////////////////////////////////*/

INSERT INTO comments (comment_id, video_url, commenter_id, likes, comment_text, sentiment) 
SELECT FLOOR(RAND() * 100) + 1,         
       v.video_url,         
       u.user_id,         
       FLOOR(RAND() * 100) + 1,         
       CONCAT('This is a ', IF(RAND() < 0.5, 'sample', 'education'), ' comment.'),         
       (RAND() * 2) - 1   
FROM information_video v  
CROSS JOIN users u  
WHERE v.video_url IN (SELECT video_url FROM information_video)  
AND u.user_id IN (SELECT user_id FROM users)  
LIMIT 10;




select * from information_video;


select * from comments;

update information_video
set keyword = IF(RAND() < 0.5, 'sample', 'education');

drop table information_video;
show tables;

select * from video;

select * from video; 

update video
set upload_date = '2023-01-26'
where description = 'Learn how to sing';
