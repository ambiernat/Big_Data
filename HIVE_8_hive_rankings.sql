-- 5 most popular products (based on number of reviews)
select *
from projectdb.hive_analysis_final
order by count_asin desc
limit 5;

-- most popular products for each category (based on number of reviews)
with q2 as (
  select a.*
  from q1 a
  where a.count_asin = a.max_count_asin_per_cat and a.category is not null
),
q1 as (
  select *,
		MAX(count_asin) OVER (PARTITION BY category) as max_count_asin_per_cat
  from projectdb.hive_analysis_final
)
select *
from q2;


-- 5 highest rated products
select *
from projectdb.hive_analysis_final
order by mean_review desc
limit 5;

-- highest rated products for each category
-- as there are many books rated 5 for categories, we choose the ones with the highest number of reviews
with q4 as (
  select a.*
  from q3 a
  where a.count_asin = a.max_count_asin_per_cat and a.category is not null
),
q3 as (
  select *,
		MAX(count_asin) OVER (PARTITION BY category) as max_count_asin_per_cat
  from q2
),
q2 as (
  select a.*
  from q1 a
  where a.mean_review = a.max_mean_review_per_cat and a.category is not null
),
q1 as (
  select *,
		MAX(mean_review) OVER (PARTITION BY category) as max_mean_review_per_cat
  from projectdb.hive_analysis_final
)
select *
from q4;



-- 5 highest rated products - mixed measure
select *
from projectdb.hive_analysis_final
order by mean_review_uniform desc
limit 5;

-- highest rated products per category - mixed measure
with q2 as (
  select a.*
  from q1 a
  where a.mean_review_uniform = a.max_mean_review_uniform_per_cat and a.category is not null
),
q1 as (
  select *,
		MAX(mean_review_uniform) OVER (PARTITION BY category) as max_mean_review_uniform_per_cat
  from projectdb.hive_analysis_final
)
select *
from q2;
