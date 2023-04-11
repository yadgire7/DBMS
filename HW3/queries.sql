CREATE TABLE my_map (place varchar, geom geometry);

INSERT INTO my_map VALUES
  ('Home','POINT(-118.2881514 34.0319636)'),
	('Roski School of Art and Design | Dept. of Art and design', 'POINT(-118.28731447257343 34.01898268908766)'),
	('Roski School of Art and Design | Dept. of Urban Design', 'POINT(-118.28802487687939 34.019393760718295)'),
	('Thornton School of Music | building1', 'POINT(-118.28512560700669 34.02220909573416)'),
	('Thornton School of Music | building2', 'POINT(-118.2851770191111 34.022631391861935)'),
	('USC School of Cinematic Arts | Building1', 'POINT(-118.28738888920063 34.023609121494246)'),
	('USC School of Cinematic Arts | Building2', 'POINT(-118.2861420507534 34.0238157250828)'),
	('Marshall School of Business | Dept. of Data Sciences and Operations', 'POINT(-118.2854864757678 34.01878544667401)'),
	('Marshall School of Business | Dept. of Finance and Business Economics', 'POINT(-118.28540157650629 34.0186488852522)'),
	('Annenberg School for Communication and Journalism | Building1', 'POINT(-118.28661356954078 34.02215962878781)'),
	('Annenberg School for Communication and Journalism | Building2', 'POINT(-118.2883033974312 34.02128388787245)'),
	('Viterbi School of Engineering | Dept. of Electrical Engineering', 'POINT(-118.29040412008904 34.019811037074874)'),
	('Viterbi School of Engineering | Dept. of Aerospace Engineering', 'POINT(-118.28957217302153 34.02105106501422)');

-- query for lookup
SELECT place, ST_AsText(geom) FROM my_map;

-- query to get convex hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM my_map;

-- POLYGON((-118.28540157650629 34.0186488852522,-118.28731447257343 34.01898268908766,-118.29040412008904 34.019811037074874,-118.2881514 34.0319636,-118.2851770191111 34.022631391861935,-118.28512560700669 34.02220909573416,-118.28540157650629 34.0186488852522))

-- Query to get 4 nearest neighbours from 'Home'
SELECT place, ST_Astext(geom) as coords, ST_Distance(geom,'POINT(-118.2881514 34.0319636)') as distance_from_home 
FROM my_map
WHERE place <> 'Home' 
ORDER BY ST_Distance(geom,'POINT(-118.2881514 34.0319636)') 
limit 4;




