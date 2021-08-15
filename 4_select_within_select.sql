-- 1
select
    name
from
    world
where
    population > (select population from world where name = 'Russia') 

-- 2
select
    name
from
    world
where
    continent = 'Europe' and 
    (gdp / population) > (select (gdp / population) from world 
                          where name = 'United Kingdom')

-- 3
select
    name, continent
from
    world
where
    continent in (select continent from world
                  where name = 'Argentina' or name = 'Australia')
order by
    name

-- 4
select 
    name, population
from
    world
where
    population > (select population from world where name = 'Canada')
    and
    population < (select population from world where name = 'Poland')

-- 5
select
    name, concat(
              cast(
                  round(population / (select population 
                                      from world 
                                      where name = 'Germany') * 100, 0)
              as integer),
          '%') as 'percentage'
from
    world
where
    continent = 'Europe'

-- 6
select
    name
from
    world
where
    gdp > all(select gdp from world where continent = 'Europe' and gdp > 0)