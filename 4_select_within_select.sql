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

-- 7
select
    continent, name, area
FROM 
    world as x
where
    area >= ALL(select
                    area
                from
                    world as y
                where
                    y.continent = x.continent and population > 0)

--8
select
    continent, name
from
    world as x
where
    name <= all(select name from world as y where y.continent = x.continent)

--9
select
    name, continent, population
from
    world as x
where
    25000000 > all(
        select population
        from world as y
        where y.continent = x.continent and y.population > 0
    )

--10
select
    name, continent
from
    world as x
where 
    x.population >= 3 * (
        select max(population)
        from world as y
        where y.continent = x.continent and x.name != y.name
    )
