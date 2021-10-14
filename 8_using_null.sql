-- 1
select
    name
from
    teacher
where
    dept is null
;

-- 2
-- defaultのままでok...
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3
select
    t.name, d.name
from
    teacher as t
    left outer join dept as d
    on t.dept = d.id
;

-- 4
select
       t.name, d.name
from
    teacher as t
    right outer join dept as d
    on t.dept = d.id
;

-- 5
select
    name, coalesce(mobile, '07986 444 2266')
from
    teacher
;

-- 6
select
    t.name, coalesce(d.name, 'None')
from
    teacher as t
    left outer join dept as d
    on t.dept = d.id
;

-- 7
select
    count(name), count(mobile)
from
    teacher
;

-- 8
select
    d.name, count(t.name)
from
    teacher as t
    right outer join dept as d
    on t.dept = d.id
group by
    d.name
;

-- 9
select
    name,
    case when dept in (1, 2) then 'Sci' else 'Art' end
from
    teacher
;

-- 10
select
    name,
    case 
        when dept in (1, 2) then 'Sci'
        when dept = 3 then 'Art' 
        else 'None'
    end
from
    teacher
;
