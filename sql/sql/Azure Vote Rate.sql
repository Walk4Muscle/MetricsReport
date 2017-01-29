select count(*) as '>2vote'
,Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) AS 'month_date'
 from question where question_id in (select c.question_id from
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

--union 

--select question_id 
--from Question   
--where question_id in  
--(  
 
--select question_id  
--from Question_TagsRelation   
--where tagname ='azure' or tagname = 'node.js'  
--group by question_id  
--having count(*)=2  
--)  
--group by question_id 

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

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-08-31'))c on a.question_id = c.question_id join
(select * from Answers where score>1)b on c.question_id = b.question_id)  --inner join
--(select * from SupportEngineers )d on b.owner_id = d.stackoverflow_user_id)
group by
Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))


----------------------------------------------------------------------------------------
select count(*) as 'total_vol' 

,Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) AS 'month_date'
from question where question_id in (select c.question_id from
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

--union 

--select question_id 
--from Question   
--where question_id in  
--(  
 
--select question_id  
--from Question_TagsRelation   
--where tagname ='azure' or tagname = 'node.js'  
--group by question_id  
--having count(*)=2  
--)  
--group by question_id 

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

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-08-31'))c on a.question_id = c.question_id )
group by
Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))
--------------------------------------------------------------------------------------------------------
select count(*) as '>1vote' 
,Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) AS 'month_date'
from question where question_id in (select c.question_id from
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

--union 

--select question_id 
--from Question   
--where question_id in  
--(  
 
--select question_id  
--from Question_TagsRelation   
--where tagname ='azure' or tagname = 'node.js'  
--group by question_id  
--having count(*)=2  
--)  
--group by question_id 

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

(select * from Question where  creation_date >datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-08-31'))c on a.question_id = c.question_id join
(select * from Answers where score>=1)b on c.question_id = b.question_id  )
group by
Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))

-----------------------------------
select count(*) as 'engnieer_number>1'
,Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) AS 'month_date'
 from question where question_id in (select c.question_id from
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

--select question_id 
--from Question   
--where question_id in  
--(  
 
--select question_id  
--from Question_TagsRelation   
--where tagname ='azure' or tagname = 'node.js'  
--group by question_id  
--having count(*)=2  
--)  
--group by question_id 

--union 

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

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-01-01') and creation_date < datediff(s, '1970-01-01', '2015-08-31'))c on a.question_id = c.question_id join
(select * from Answers where score>=1)b on c.question_id = b.question_id  inner join
(select * from SupportEngineers where alias='dxu'or alias='wshao'or alias='v-guiliu' or alias='v-jiapa' or alias='v-jayao')d on b.owner_id = d.stackoverflow_user_id)
group by
Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))
-------------------------------------------------------------------------------
select count(*) as 'engnieer_number>2'
,Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) AS 'month_date'
 from question where question_id in (select c.question_id from
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

--select question_id 
--from Question   
--where question_id in  
--(  
 
--select question_id  
--from Question_TagsRelation   
--where tagname ='azure' or tagname = 'node.js'  
--group by question_id  
--having count(*)=2  
--)  
--group by question_id 

--union 

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

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-09-01') and creation_date < datediff(s, '1970-01-01', '2015-10-01'))c on a.question_id = c.question_id join
(select * from Answers where score>1)b on c.question_id = b.question_id  inner join
(select * from SupportEngineers where alias='dxu'or alias='wshao'or alias='v-guiliu' or alias='v-jiapa' or alias='v-jayao')d on b.owner_id = d.stackoverflow_user_id)
group by
Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))