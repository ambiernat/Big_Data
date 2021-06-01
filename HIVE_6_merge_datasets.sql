drop table if exists projectdb.kindle_and_meta_merged;
create table projectdb.kindle_and_meta_merged
as
with q2 as (
-- attach 'title' and 'category' columns from meta Kindle file
  select a.*,
	 b.category,
	 b.title
  from q1 a
  left join projectdb.meta_kindle_all_cat_v2 b
  on a.asin = b.asin
),
q1 as(
-- filter only needed columns from kindle file
  SELECT 
		a.overall,
		a.reviewerid,
		a.reviewtext,
  		a.asin,
		a.count_asin,
		a.mean_review
  FROM projectdb.kindle_all_v5 a  
)
select * from q2
order by count_asin desc;



drop table if exists projectdb.for_nlp_models;
-- extract only those data that are needed for the nlp analysis and modelling part
create table projectdb.for_nlp_models
as
select 
	asin,
	overall, 
	reviewtext, 
	category
from projectdb.kindle_and_meta_merged;



drop table if exists projectdb.reduced_asin_hive_analysis;
-- group by asin; this is to do some aggregations and analyses in Hive
create table projectdb.reduced_asin_hive_analysis
as
select 
	asin,
	overall, 
	category,
	count_asin,
	mean_review
from projectdb.kindle_and_meta_merged;
