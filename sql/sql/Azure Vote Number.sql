SELECT       COUNT(c.question_id) as number_eq_1, 
--c.score, b.answer_id, b.owner_id, b.is_accepted, b.score AS answers_vote,
 --                        d.stackoverflow_user_id, 
						 Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) as 'month_date'
FROM            
( select question_id
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='azure' or tagname = 'php'  
group by question_id  
having count(*)=2  
)  
group by question_id 

union 

 select question_id 
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='azure' or tagname = 'java'  
group by question_id  
having count(*)=2  
)  
group by question_id 

union 

 select question_id 
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='azure' or tagname = 'node.js'  
group by question_id  
having count(*)=2  
)  
group by question_id 

union 

 select question_id 
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='azure' or tagname = 'python'  
group by question_id  
having count(*)=2  
)  
group by question_id )a inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-10-20'))c on a.question_id = c.question_id join
(select * from Answers )b on c.question_id = b.question_id and b.score>0-- inner join
--(select * from SupportEngineers where alias='dxu'or alias='wshao'or alias='v-guiliu' or alias='v-jiapa' or alias='v-jayao')d on b.owner_id = d.stackoverflow_user_id

group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970'))
--,c.question_id, c.score, b.answer_id, b.owner_id, b.is_accepted, b.score,d.stackoverflow_user_id

--WHERE        (dbo.SupportEngineers.alias = 'wshao')
--select sum(cast(b.score as int)) as 'vote', SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) as 'accepted',cast(sum(cast(b.score as int)) *10 + SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) *15 as float ) as 'result points'  
--,Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) AS 'month_date',d.alias
--from
--dbo.Question LEFT OUTER JOIN
          --               dbo.Answers INNER JOIN
         --                dbo.SupportEngineers ON dbo.Answers.owner_id = dbo.SupportEngineers.stackoverflow_user_id ON dbo.Question.question_id = dbo.Answers.question_id

-----------------------------------
