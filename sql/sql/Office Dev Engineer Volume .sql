

----------reply volume
SELECT       -- a.owner_id, 
				COUNT(q.question_id) as 'Office Dev tags_reply_number', 
				--q.title, 
				s.alias, 
				Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970')) as 'Month_date'--, 
				--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970')) AS 'WeekNumber'
				--,
				--q.creation_date, 
				--sum(a.score) as 'vote_score'
				--counta.is_accepted = 'True' as 'answered'
FROM            dbo.Answers a  JOIN
				(select * from dbo.Question where  creation_date > datediff(s, '1970-01-01', '2015-05-25') 
					and creation_date < datediff(s, '1970-01-01', '2015-8-30')) 
				q ON a.question_id = q.question_id --and a.is_accepted='True'
				--DATEDIFF(week, '2011-05-30', date) AS WeekNumber,
inner join
                (select * from dbo.SupportEngineers
						 Where alias='wshao'
							or alias='dxu'
							or alias='v-jiapa'
							or alias='v-guiliu')s
				 ON a.owner_id = s.stackoverflow_user_id
                        
group by --COUNT(q.question_id),Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))
			s.alias,
			Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))--,
			
			--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))
			--,sum(a.score)
			--, count(a.is_accepted)

------------------------------------ question volume

SELECT
	count(question_id) as 'Office Dev question Volume',
	Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) as 'Month_date'--, 
	--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, creation_date), '1/1/1970')) as 'Week_Name'
	from Question where creation_date > datediff(s, '1970-01-01', '2015-05-25') and creation_date < datediff(s, '1970-01-01', '2015-8-30') and question_id in 
(select question_id from
	( select question_id
	from Question   
	where question_id in  
		(  
 
		select question_id  
		from Question_TagsRelation   
		where tagname ='office365' or tagname = 'office365-apps' or tagname='office365api' or tagname='office365-restapi' or tagname='office365-addin' 
		group by question_id  	
		)
		group by question_id )a)
		group by Month(DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))
		--,
			
			--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, creation_date), '1/1/1970'))

------------------Answer Volume

SELECT       -- a.owner_id, 
				COUNT(q.question_id) as '3 tags_reply_number_accept', 
				--q.title, 
				s.alias, 
				Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970')) as 'Month_date'--, 
				--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970')) AS 'WeekNumber'
				--,
				--q.creation_date, 
				--sum(a.score) as 'vote_score'
				--counta.is_accepted = 'True' as 'answered'
FROM            dbo.Answers a  JOIN
				(select * from dbo.Question where  creation_date > datediff(s, '1970-01-01', '2015-05-25') 
					and creation_date < datediff(s, '1970-01-01', '2015-8-30')) 
				q ON a.question_id = q.question_id and a.is_accepted='True'
				--DATEDIFF(week, '2011-05-30', date) AS WeekNumber,
inner join
                (select * from dbo.SupportEngineers
						 Where alias='wshao'
							or alias='dxu'
							or alias='v-jiapa'
							or alias='v-guiliu')s
				 ON a.owner_id = s.stackoverflow_user_id
                        
group by --COUNT(q.question_id),Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))
			s.alias,
			Month(DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))--,
			
			--DATEDIFF(week, '2015-05-25', DATEADD(s, CONVERT(int, q.creation_date), '1/1/1970'))
			--,sum(a.score)
			--, count(a.is_accepted)

