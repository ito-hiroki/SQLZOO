-- 1
select
    matchid, player
from
    goal
where
    teamid = 'GER'
;

-- 2
SELECT 
    id,stadium,team1,team2
FROM
    game
where
    id = 1012
;

-- 3
select
    goal.player, goal.teamid, game.stadium, game.mdate
from
    game
    join goal 
    on game.id = goal.matchid
where
    goal.teamid = 'GER'
;

-- 4
select
    team1, team2, player
from
    goal
    join game
    on game.id = goal.matchid
where
    player LIKE 'Mario%'
;

-- 5
select
    player, teamid, coach, gtime
from
    goal
    join eteam
    on teamid = id
where
    gtime <= 10
;

-- 6
select
    g.mdate, e.teamname
from
    game as g
    join eteam as e
    on e.id = g.team1
where
    e.coach = 'Fernando Santos'
;

-- 7
select
    go.player
from
    goal as go
    join game as ga
    on go.matchid = ga.id
where
    ga.stadium = 'National Stadium, Warsaw'
;

-- 8
select
    distinct(player)
from
    game
    join goal
    on matchid = id
where
    (team1 = 'GER' or team2='GER') and teamid != 'GER'
;

-- 9
select
    teamname, count(*)
from
    goal
    join eteam
    on teamid = id
group by
    teamname
;

-- 10
select
    stadium, count(*)
from
    goal
    left outer join game
    on matchid = id
group by
    stadium
;

-- 11
select
    matchid, mdate, count(*)
from
    goal
    left outer join game
    on matchid = id
where
    team1 = 'POL' or team2 = 'POL'
group by
    matchid, mdate
;
