DECLARE @tmp Table (pageview int, question_id nvarchar(50), link nvarchar(500), ownerid nvarchar(50))
DECLARE @result Table (pageview int, question_id nvarchar(50), link nvarchar(500), ownerid nvarchar(50))

delete @tmp

insert into @tmp
select * from
(
select MAX(a.pageview) as pageview, a.question_id as question_id, Max(a.link) as link, an.owner_id as ownerid
from
( select question_id, Max(view_count) as pageview, Max(link) as link
from Question  
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'python'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')

group by question_id 

union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'java'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')
group by question_id 
union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'php'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')
group by question_id 
union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'node.js'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-08') and creation_date < datediff(s, '1970-01-01', '2015-10-15')
group by question_id 
) a inner join
QuestionOwnership qo
on a.question_id = qo.question_id
inner join 
Answers an
on an.question_id = a.question_id
 group by a.question_id, an.owner_id
 ) aaa


delete @tmp
insert into @tmp
select * from
(
select MAX(a.pageview) as pageview, a.question_id as question_id, Max(a.link) as link,co.owner_id
from
( select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'python'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')
group by question_id 

union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'java'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')
group by question_id 
union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'php'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-03') and creation_date < datediff(s, '1970-01-01', '2015-10-30')
group by question_id 
union 

 select question_id, Max(view_count) as pageview, Max(link) as link
from Question   
where question_id in  
(  
 
select question_id
from Question_TagsRelation   
where tagname ='azure' or tagname = 'node.js'  
group by question_id  
having count(*)=2  
)  and creation_date > datediff(s, '1970-01-01', '2015-10-08') and creation_date < datediff(s, '1970-01-01', '2015-10-15')
group by question_id 

) a inner join
QuestionOwnership qo
on
a.question_id = qo.question_id
join 
Comments co
on a.question_id = co.question_id


group by a.question_id, co.owner_id,a.pageview,link

--order by a.pageview DESC
 ) bbb


delete @result

insert into @result
select pageview, question_id, link, ownerid
from @tmp
group by  pageview, question_id, link, ownerid

select Max(pageview) as pageview, question_id, MAX(link) as link, COUNT(ownerid) as usercount
from @result
group by question_id
order by usercount DESC, question_id
