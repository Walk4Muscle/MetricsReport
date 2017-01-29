select sum(cast(b.score as int)) as 'vote', SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) as 'accepted',cast(sum(cast(b.score as int)) *10 + SUM(CASE WHEN b.is_accepted = 'True' then 1 else 0 end) *15 as float ) as 'result points'  
,Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) AS 'month_date'--,d.alias
from
( select question_id
from Question   
where question_id in  
(   
select question_id  
from Question_TagsRelation   
where tagname ='visual-studio-online' or tagname='tfs' or tagname='tfs2013' or tagname='tfs2015' or tagname='team-explorer-everywhere' or tagname='tfsbuild'
group by question_id ))a inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-11-02'))c on a.question_id = c.question_id join
(select * from Answers where owner_id='5475003' )b on c.question_id = b.question_id --inner join
--(select * from SupportEngineers where alias='Visong'or alias='v-xindo'or alias='Eddie' or alias='v-patrlu')d on b.owner_id = d.stackoverflow_user_id or 


group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970'))--,d.alias