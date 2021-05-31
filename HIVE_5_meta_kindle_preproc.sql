
drop table if exists projectdb.meta_kindle_all_cat_v2;
create table projectdb.meta_kindle_all_cat_v2
as
with q5 as (
--replace "amp" and a "\" sign with nothing; this is another cleaning step
	select 
		asin,
		title,
		regexp_replace(regexp_replace(category, "amp", ""), "\u003B", "") as category
	from q4
),
q4 as (
-- keep only those that do not contain 'minutes', 'kindle' or '<' strings as well as are not null
  select * 
  from q3
  where instr(category, 'minutes') = 0 and instr(category, 'kindle') = 0 and instr(category, '<') = 0 and category is not null
),
q3 as (
	select 
	-- convert all entries in the cat_list columns into lowercase; this is to allow easier manipulation of the data
		asin, 
		title,
		LOWER(cat_list) as category
	from q2
),
q2 as (
-- "explode" category column i.e. transform elements of the list in the category column into separate columns
  SELECT 
	asin,
	title,
	cat_list
  FROM q1 LATERAL VIEW explode(category) adTable AS cat_list
  ),
q1 as (
	select asin,
		title,
		category
	from projectdb.meta_kindle_all
)
select * 
from q5;


