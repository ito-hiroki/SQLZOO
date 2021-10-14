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
