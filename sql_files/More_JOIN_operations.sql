--1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962
--When was Citizen Kane released?
SELECT yr FROM movie WHERE title='Citizen Kane'
--Star Trek movies
SELECT id,title,yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr
--id for actor Glenn Close
SELECT id FROM actor WHERE name = 'Glenn Close'
--id for Casablanca
SELECT id FROM movie WHERE title=  'Casablanca'
--Cast list for Casablanca
SELECT name FROM actor JOIN casting ON (actorid = id) 
WHERE movieid=11768
--Alien cast list
SELECT name FROM actor JOIN casting ON (actorid = id) 
WHERE movieid = (SELECT id FROM movie WHERE title='Alien')
--Harrison Ford movies
SELECT title FROM movie JOIN casting ON (movieid = id) 
WHERE actorid = (SELECT id FROM actor WHERE name ='Harrison Ford' )
--Harrison Ford as a supporting actor
SELECT title FROM movie JOIN casting ON (movieid = id) 
WHERE actorid = (SELECT id FROM actor WHERE name ='Harrison Ford') AND ord <> 1

--Lead actors in 1962 movies
SELECT title, actor.name FROM movie JOIN casting ON (movieid = movie.id) 
JOIN actor ON (actorid = actor.id) WHERE yr = 1962 AND ord = 1

--Busy years for John Travolta
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

--Lead actor in Julie Andrews movies
--Actors with 30 leading roles