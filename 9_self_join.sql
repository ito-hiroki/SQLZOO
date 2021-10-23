-- 1
select count(*)
from stops
;

-- 2
select
    id
from
    stops
where
    name = 'Craiglockhart'
;

-- 3
select
    s.id, s.name
from
    stops as s
    join route as r
    on s.id = r.stop
where
    r.num = 4 and company = 'LRT'
order by
    r.pos
;

-- 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having COUNT(*) = 2
;

-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop = (select id from stops where name = 'London Road')
;

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road'

-- 7
select
    distinct a.company, a.num
from 
    route as a
    join route as b
    on  a.company=b.company AND a.num=b.num
where
    a.stop = 115 and b.stop = 137
;

-- 8
select
    distinct a.company, a.num
from 
    route as a
    join route as b
    on a.company=b.company AND a.num=b.num
where
    a.stop = (select id from stops where name = 'Craiglockhart')
    and b.stop = (select id from stops where name = 'Tollcross')
;

-- 9

