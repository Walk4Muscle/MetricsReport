select TOP 10 * from 
Question 
where creation_date > datediff(s, '1970-01-01', '2016-2-01') and creation_date < datediff(s, '1970-01-01', '2016-2-29') 
and CHARINDEX('PHP',tags) > 0 and  CHARINDEX('azure',tags) > 0
order by view_count desc