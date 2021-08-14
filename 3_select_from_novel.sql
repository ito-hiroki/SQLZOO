-- 1
select
    yr, subject, winner
from
    nobel
where
    yr = 1950

-- 2
select
    winner
from
    nobel
where
    subject = 'Literature' and yr = 1962

-- 3
select
    yr, subject
from
    nobel
where
    winner = 'Albert Einstein'

-- 4
select
    winner
from
    nobel
where
    subject = 'Peace' and yr >= 2000

-- 5
select
    *
from
    nobel
where
    subject = 'Literature' and yr between 1980 and 1989

-- 6
select
    *
from 
    nobel
where
    winner in ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7
select
    winner
from
    nobel
where
    winner like 'John%'

-- 8
select
    *
from
    nobel
where
    yr = 1980 and subject = 'Physics' or
    yr = 1984 and subject = 'Chemistry'

-- 9
select
    *
from
    nobel
where
    yr = 1980 and
    not subject in ('Chemistry', 'Medicine')

-- 10
select
    *
from
    nobel
where
    yr < 1910 and subject = 'Medicine' or 
    yr >= 2004 and subject = 'Literature'

-- 11
select
    *
from
    nobel
where
    winner = 'PETER GRÜNBERG'

-- 12
select
    *
from
    nobel
where
    winner = 'EUGENE O''NEILL'

-- 13
select
    winner, yr, subject
from
    nobel
where
    winner like 'Sir%'
order by 
    yr desc, winner

-- 14
-- This statement cause error. Why...
SELECT
    winner, subject
FROM
    nobel
WHERE
    yr = 1984
ORDER BY
    subject IN ('Physics', 'Chemistry'), subject, winner