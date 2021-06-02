drop table if exists reduced_asin_hive_analysis_v2;
create table reduced_asin_hive_analysis_v2 
as
with q7 as (
  select a.*,
  		0.7 + 0.3*a.ln_count_asin_suniform as ln_count_asin_uniform
  from q6 a
),
q6 as (
  select a.*,
  		a.ln_count_asin_min_diff/a.ln_count_asin_maxmin_diff as ln_count_asin_suniform
  from q5 a
),
q5 as (
  select a.*,
  		a.ln_count_asin - a.ln_count_asin_min as ln_count_asin_min_diff,
  		a.ln_count_asin_max - a.ln_count_asin_min as ln_count_asin_maxmin_diff
  from q4 a
),
q4 as (
  select a.*,
  	MAX(a.ln_count_asin) OVER () as ln_count_asin_max,
  	MIN(a.ln_count_asin) OVER () as ln_count_asin_min
  from q3 a
),
q3 as(
SELECT a.*,
	ln(mean_review) as ln_mean_review, 
	ln(count_asin) as ln_count_asin
FROM q2 a
),
q2 as (
	select a.asin,
  		b.category,
  		b.count_asin,
		b.title,
  		b.mean_review
  	from q1 a
  	left join reduced_asin_hive_analysis b
  	on (a.asin = b.asin)
),
q1 as (
  SELECT 
  	asin, 
  	count(category) as counted
  FROM reduced_asin_hive_analysis
  group by asin
  having counted <=1
)
select *
from q7;



drop table if exists projectdb.hive_analysis_final;
create table projectdb.hive_analysis_final
as
with 
q1 as(
  select a.*,
		a.mean_review*a.ln_count_asin_suniform as mean_review_suniform,
		a.mean_review*a.ln_count_asin_uniform as mean_review_uniform
  FROM projectdb.reduced_asin_hive_analysis_v2 a  
)
select * from q1;
