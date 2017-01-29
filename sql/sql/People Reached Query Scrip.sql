select sum(view_count)as 'view_accounts',Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) as 'Month_date'from question where question_id in 
(select c.question_id from
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
		group by question_id )a 
		inner join

		(select * from Question where  creation_date > datediff(s, '1970-01-01', '2015-10-01') and creation_date < datediff(s, '1970-01-01', '2016-2-29'))c on a.question_id = c.question_id join
		(select * from Answers )b on c.question_id = b.question_id inner join
		(select * from SupportEngineers) d on b.owner_id = d.stackoverflow_user_id and d.alias='v-jiapa')
group by Month(DATEADD(s, CONVERT(int,creation_date), '1/1/1970'))

--Month(DATEADD(s, CONVERT(int,c.creation_date), '1/1/1970')) AS 'month_date',d.alias