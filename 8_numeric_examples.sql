-- 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- 2
select
    institution, subject
from
    nss
where
    question = 'Q15'
    and score >= 100
;

-- 3
select
    institution, score
from
    nss
where
    question = 'Q15'
    and subject = '(8) Computer Science'
    and score < 50
;

-- 4
select
    subject, sum(response)
from
    nss
where
    question = 'Q22'
    and (subject = '(8) Computer Science' or subject = '(H) Creative Arts and Design')
group by
    subject
;

-- 5
select
    subject, sum(A_STRONGLY_AGREE*response*0.01)
from
    nss
where
    question = 'Q22'
    and (subject = '(8) Computer Science' or subject = '(H) Creative Arts and Design')
group by
    subject
;

-- 6
select
    subject, round(sum(A_STRONGLY_AGREE*response*0.01) / sum(response)*100, 0)
from
    nss
where
    question = 'Q22'
    and (subject = '(8) Computer Science' or subject = '(H) Creative Arts and Design')
group by
    subject
;

-- 7
select
    institution, round(sum(score*response*0.01) / sum(response) * 100, 0)
from
    nss
where
    question = 'Q22'
    and institution like '%Manchester%'
group by
    institution
;

-- 8
select
    institution, sum(sample), 
    sum(
        case subject
            when subject = '(8) Computer Science' then 0
            else sample
        end
    )
from
    nss
where
    question = 'Q01'
    and institution like '%Manchester%'
group by
    institution
;
