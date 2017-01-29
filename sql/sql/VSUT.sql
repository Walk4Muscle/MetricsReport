select sum(b.UT) as VSOUT,
Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) as 'Month_date',
b.alias
from
( select question_id
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='visual-studio-online' or tagname = 'vs-team-services'  
group by question_id  
) 
group by question_id )a inner join
(select * from UTLogs)b on a.question_id = b.question_id inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2016-2-01') and creation_date < datediff(s, '1970-01-01', '2016-2-29'))c on a.question_id = c.question_id
group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')),b.alias



select sum(b.UT) as TFSUT,
Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')) as 'Month_date',
b.alias
from
( select question_id
from Question   
where question_id in  
(  
 
select question_id  
from Question_TagsRelation   
where tagname ='tfs' or tagname = 'tfs2013' or tagname = 'tfs2015' or tagname = 'team-explorer-everywhere' or tagname = 'tfsbuild'       
group by question_id  
) 
group by question_id )a inner join
(select * from UTLogs)b on a.question_id = b.question_id inner join

(select * from Question where  creation_date > datediff(s, '1970-01-01', '2016-2-01') and creation_date < datediff(s, '1970-01-01', '2016-2-29'))c on a.question_id = c.question_id
group by Month(DATEADD(s, CONVERT(int, c.creation_date), '1/1/1970')),b.alias