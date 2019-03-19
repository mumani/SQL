--Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
--1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
--Albert Einstein
SELECT yr, subject FROM nobel WHERE winner LIKE 'Albert Einstein'
--Recent Peace Prizes
SELECT winner FROM nobel WHERE yr > 1999 AND subject = 'Peace'
--Literature in the 1980's
SELECT * FROM nobel WHERE yr > 1979 AND yr < 1990 AND subject = 'Literature'
--Only Presidents
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
'Barack Obama')
--John
SELECT winner FROM nobel WHERE winner LIKE 'John%'
--Chemistry and Physics from different years
SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR yr = 1984 AND subject = 'Chemistry'
--Exclude Chemists and Medics
SELECT * FROM nobel WHERE yr = 1980 AND subject <> 'Medicine' AND subject <> 'Chemistry'
--Early Medicine, Late Literature
SELECT * FROM nobel WHERE subject = 'Literature' AND yr > 2003 OR yr < 1910 AND subject = 'Medicine'
--Umlaut
SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'
--Apostrophe
SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL'
--Knights of the realm
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner
--Chemistry and Physics last
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner