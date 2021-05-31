
create table projectdb.kindle_all_v5
-- create table with books that appear at least 10 times in the dataset
-- calculate mean review for each book as defined by asin
-- filter only verified purchases entries to avoid unreliable reviews (just in case)
-- caluclate mean number of reviews across a certain book as defined by asin
as
with q3 as(
  
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
  		a.count_asin,
  		a.mean_review,
		AVG(a.count_asin) OVER (PARTITION BY a.asin) as mean_no_reviews
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
order by count_asin desc;
