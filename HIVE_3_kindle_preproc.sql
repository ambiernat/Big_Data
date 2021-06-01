drop table if exists projectdb.kindle_all_v1;
create table projectdb.kindle_all_v1
-- filter only these entries for which asin is not null
as
with q1 as(
 	select 
	a.overall,
	a.vote,
	a.verified,
	a.reviewerid,
	a.asin,
	a.style,
	a.reviewtext,
	a.summary,
	a.unixreviewtime
	from kindle_all a 
	where a.asin is not null
)
select * from q1;




drop table if exists projectdb.kindle_all_v5;

-- create table with books that appear at least 10 times in the dataset
-- calculate mean review for each book as defined by asin
-- filter only verified purchases entries to avoid unreliable reviews (just in case)
-- caluclate mean number of reviews across a certain book as defined by asin
-- move text reviews from 'vote' column to 'reviewtext' column if there is no text in the 'reviewcolumn'

create table projectdb.kindle_all_v5
as
with q3 as(
  
  SELECT 
		a.overall,
		a.vote,
		a.verified,
		a.reviewerid,
		a.style,
		case when a.reviewtext is null and LENGTH(a.vote)>3 then a.vote 
  			else a.reviewtext 
  		end as reviewtext,
		a.summary,
		a.unixreviewtime,
  		a.asin,
  		a.count_asin,
  		a.mean_review
  FROM q2 a  
),

q2 as(
  
  SELECT 
		a.overall,
		a.vote,
		a.verified,
		a.reviewerid,
		a.style,
		a.reviewtext,
		a.summary,
		a.unixreviewtime,
  		a.asin,
		COUNT(a.asin) OVER (PARTITION BY a.asin) as count_asin,
		AVG(a.overall) OVER (PARTITION BY a.asin) as mean_review
  FROM q1 a  
),

q1 as(
  
  SELECT 
		a.overall,
		a.vote,
		a.verified,
		a.reviewerid,
		a.style,
		a.reviewtext,
		a.summary,
		a.unixreviewtime,
  		a.asin
  FROM projectdb.kindle_all_v1 a  
  where a.verified = true
)

select * from q3
where count_asin >= 10
