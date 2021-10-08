-- 1
select
    id, title
from
    movie
where
    yr = 1962
;

-- 2
select
    yr
from
    movie
where
    title = 'Citizen Kane'
;

-- 3
select
    id, title, yr
from
    movie
where
    title like '%Star Trek%'
order by
    yr
;

-- 4
select
    id
from
    actor
where
    name = 'Glenn Close'
;

-- 5
select
    id
from
    movie
where
    title = 'Casablanca'
;

-- 6
select
    a.name
from
    casting as c
    join actor as a
    on c.actorid = a.id
where
    c.movieid = 11768
;

-- 7
select
    a.name
from
    casting as c
    join actor as a
    on c.actorid = a.id
where
    c.movieid = (select id from movie where title = 'Alien')
;

-- 8
select
    m.title
from
    casting as c
    join movie as m
    on c.movieid = m.id
where
    c.actorid = (select id from actor where name = 'Harrison Ford')
;

-- 9
select
    m.title
from
    casting as c
    join movie as m
    on c.movieid = m.id
where
    c.actorid = (select id from actor where name = 'Harrison Ford')
    and c.ord != 1
;

-- 10
select
    m.title, a.name
from
    casting as c
    join movie as m
    on c.movieid = m.id

    join actor as a
    on c.actorid = a.id
where
    c.ord = 1 and m.yr = 1962
;

-- 11
select
    m.yr, count(*) as num
from
    movie as m
    join casting as c
    on c.movieid = m.id
where
    c.actorid = (select id from actor where name = 'John Travolta')
group by
    m.yr
having
    num > 2
;

-- 12
select
    m.title, a.name
from
    (
        select
            movieid, actorid
        from
            casting as c
        where
            c.movieid in (
                select
                    movieid
                from
                    casting
                where
                    actorid = (select id from actor where name = 'Julie Andrews'))
            and c.ord = 1
    ) as tmp

    join movie as m
    on tmp.movieid = m.id

    join actor as a
    on tmp.actorid = a.id
;

