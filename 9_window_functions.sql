-- 1
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

-- 2
select
    party,
    votes,
    rank() over (order by votes desc) as posn
from
    ge
where
    constituency = 'S14000024' and yr = 2017
order by
    party
;

-- 3
select
    yr, party, votes, 
    rank() over (partition by yr order by votes desc)
from
    ge
where
    constituency = 'S14000021'
order by
    party, yr
;

-- 4
select
    constituency, party, votes,
    rank() over (partition by constituency order by votes desc) as posn
from
    ge
where
    constituency between 'S14000021' and 'S14000026'
     and yr = 2017
order by
    posn, constituency
;

--5
select
    tmp.constituency, tmp.party
from
    (
        select
            constituency, party, votes,
            rank() over (partition by constituency order by votes desc) as posn
        from
            ge
        where
            constituency between 'S14000021' and 'S14000026'
            and yr = 2017
        order by
            posn, constituency
    ) as tmp
where
    tmp.posn = 1
;

-- 6
select
    t.party, count(*)
from
    (
        select
            tmp.constituency, tmp.party
        from
            (
                select
                    constituency, party, votes,
                    rank() over (partition by constituency order by votes desc) as posn
                from
                    ge
                where
                    constituency like 'S%'
                    and yr = 2017
                order by
                    posn, constituency
            ) as tmp
        where
            tmp.posn = 1
    ) as t
group by
    t.party
;
