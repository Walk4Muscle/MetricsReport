select sum(b.UT),
Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) as 'Month_date',
--LEFT(CONVERT(VARCHAR(14), DATEADD(s, CONVERT(int,c.creation_date), '1/1/1970'), 120),7)  as 'Month_date',
b.alias
from
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
(select * from UTLogs where alias='v-guiliu' or alias='wshao' or alias='dxu'or alias='v-jiapa')b on a.question_id = b.question_id inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2016-2-01') and creation_date < datediff(s, '1970-01-01', '2016-2-29'))c on a.question_id = c.question_id
group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')),b.alias