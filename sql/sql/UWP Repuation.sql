select sum(cast(b.score as int)) as 'vote', SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) as 'accepted',cast(sum(cast(b.score as int)) *10 + SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) *15 as float ) as 'result points'  
,Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) AS 'month_date'/*,d.alias*/
from
( select question_id
from Question   
where question_id in  
(   
select question_id  
from Question_TagsRelation   
where tagname ='uwp' or tagname='windows-10'
group by question_id ))a inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-10-20'))c on a.question_id = c.question_id join
(select * from Answers )b on c.question_id = b.question_id inner join
(select * from SupportEngineers where alias='alanyao'or alias='jec'or alias='yapchen' or alias='fanwu' or alias='v-fapeng' or alias='v-jamehe')d on b.owner_id = d.stackoverflow_user_id 

group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970'))/*,d.alias*/