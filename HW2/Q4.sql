-- software: MySQL Workbench (MySQL Server 8.0)
-- Query 4
-- The database is the same
-- DML statements are added below

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

-- ///////////////////////////////////////////////////////////////////////

update information_video
set keyword = IF(RAND() < 0.5, 'sample', 'education');

-- /////////////////////////////////////////////////////////////////////////

-- ********************************************************************************
select a.keyword, avg(b.sentiment) as avg_sentiment from information_video a
join comments b
on a.video_url = b.video_url
where b.comment_text LIKE concat('%',a.keyword,'%')
group by a.keyword
order by avg_sentiment desc;
-- ********************************************************************************

-- result
/*
education	-0.27060121830020634
sample	-0.3620205828920007
*/

-- the query performs a join operation on information_video and comments on url and then checks if the keyword is present the comment_text and calculated average for those comments only (group by)