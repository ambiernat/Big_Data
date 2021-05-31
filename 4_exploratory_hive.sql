--- EXPLORATORY HIVE ----

drop table if exists kindle_all_1000;

create table kindle_all_1000 as
SELECT * FROM kindle_all LIMIT 1000;



with q1 as (

SELECT vote, count(vote) as counted
FROM kindle_all_1000
group by vote
  
  ) 

select a.overall, 
	a.vote,
	a.reviewtext,
	b.counted
from kindle_all_1000 a
left join q1 b
on (a.vote = b.vote);



SELECT verified, count(verified) as counted
FROM kindle_all_1000
group by verified;

SELECT reviewerid, count(reviewerid) as counted
FROM kindle_all_1000
group by reviewerid
order by counted desc;

SELECT style, count(style) as counted
FROM kindle_all_1000
group by style
order by counted desc;

SELECT unixreviewtime, count(unixreviewtime) as counted
FROM kindle_all_1000
group by unixreviewtime
order by counted desc;

SELECT reviewtime, count(reviewtime) as counted
FROM kindle_all_1000
group by reviewtime
order by counted desc;




drop table if exists kindle_all_v5_1000;

create table kindle_all_v5_1000 as
SELECT * FROM kindle_all_v5 LIMIT 1000;



with q1 as (

SELECT vote, count(vote) as counted
FROM kindle_all_v5_1000
group by vote
  
  ) 

select a.overall, 
	a.vote,
	a.reviewtext,
	b.counted
from kindle_all_v5_1000 a
left join q1 b
on (a.vote = b.vote);


SELECT vote, count(vote) as counted
FROM kindle_all_v5_1000
group by vote;



drop table if exists meta_kindle_all_1000;

create table meta_kindle_all_1000 as
SELECT * FROM meta_kindle_all LIMIT 1000;


SELECT category, count(category) as counted
FROM meta_kindle_all_1000
group by category;


SELECT tech1, count(tech1) as counted
FROM meta_kindle_all_1000
group by tech1;

SELECT description, count(description) as counted
FROM meta_kindle_all_1000
group by description;

SELECT fit, count(fit) as counted
FROM meta_kindle_all_1000
group by fit;

SELECT title, count(title) as counted
FROM meta_kindle_all_1000
group by title;


SELECT also_buy, count(also_buy) as counted
FROM meta_kindle_all_1000
group by also_buy;


SELECT image, count(image) as counted
FROM meta_kindle_all_1000
group by image;


SELECT tech2, count(tech2) as counted
FROM meta_kindle_all_1000
group by tech2;

SELECT brand, count(brand) as counted
FROM meta_kindle_all_1000
group by brand;

SELECT feature, count(feature) as counted
FROM meta_kindle_all_1000
group by feature;

SELECT rank, count(rank) as counted
FROM meta_kindle_all_1000
group by rank;

SELECT also_view, count(also_view) as counted
FROM meta_kindle_all_1000
group by also_view;


SELECT details, count(details) as counted
FROM meta_kindle_all_1000
group by details;


SELECT main_cat, count(main_cat) as counted
FROM meta_kindle_all_1000
group by main_cat;

SELECT similar_item, count(similar_item) as counted
FROM meta_kindle_all_1000
group by similar_item;


SELECT date, count(date) as counted
FROM meta_kindle_all_1000
group by date;


SELECT price, count(price) as counted
FROM meta_kindle_all_1000
group by price;
