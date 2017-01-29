select Question_TagsRelation.tagname, count(Question_TagsRelation.tagname) as vol, 
QuestionOwnership.support_alias
from Question right join Question_TagsRelation
on Question.question_id = Question_TagsRelation.question_id
left join QuestionOwnership
on Question.question_id = QuestionOwnership.question_id

where DATEADD(s, CONVERT(int, Question.creation_date), '1/1/1970') BETWEEN CONVERT(datetime,'2017-01-01') AND CONVERT(datetime,'2017-01-27')
and support_alias = 'v-guiliu'
group by tagname,support_alias
order by vol desc