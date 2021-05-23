-- just in case, if it is already defined - drop database including all its contents
Drop database projectdb cascade;

-- create database if not already exists
Create database if not exists projectdb;

-- reset the Hive keywords - this is to force hive not to treat some of its reserved special characters / keywords as such
SET hive.support.sql11.reserved.keywords=false;

-- add jar file for reading the more complex structures in the source file; e.g. some fields have "subfields", which are also of 
-- more complex structure; this file is a format file based on which Hive knows how to read such fields
ADD JAR hdfs:///user/hive/.hiveJars/json-serde-1.3.6-SNAPSHOT-jar-with-dependencies.jar;

-- READ IN TABLES FROM HDFS - EACH TABLE SEPARATELY

-- Read in Meta_Kindle to Hive
Create external table projectdb.meta_kindle_1(
  category ARRAY <string>, 
  tech1 string, 
  description ARRAY <string>, 
  fit string, 
  title string, 
  also_buy ARRAY <string>, 
  image ARRAY <string>, 
  tech2 string, 
  brand string, 
  feature ARRAY <string>, 
  rank ARRAY <string>,
  also_view ARRAY <string>, 
  details struct<release_date:string,file_size:string,print_length:string,Page_Numbers_Source_ISBN:string,Simultaneous_Device_Usage:string,publisher:string,publication_date:string,language:string,isbn_10:string, isbn_13:string,asin:string,word_wise:string,lending:string>, 
  main_cat string, 
  similar_item string, 
  date string, 
  price string, 
  asin string
) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' 
  LOCATION '/user/maria_dev/meta_kindle_1/';

Create external table projectdb.meta_kindle_2(
  category ARRAY <string>, 
  tech1 string, 
  description ARRAY <string>, 
  fit string, 
  title string, 
  also_buy ARRAY <string>, 
  image ARRAY <string>, 
  tech2 string, 
  brand string, 
  feature ARRAY <string>, 
  rank ARRAY <string>,
  also_view ARRAY <string>, 
  details struct<release_date:string,file_size:string,print_length:string,Page_Numbers_Source_ISBN:string,Simultaneous_Device_Usage:string,publisher:string,publication_date:string,language:string,isbn_10:string, isbn_13:string,asin:string,word_wise:string,lending:string>, 
  main_cat string, 
  similar_item string, 
  date string, 
  price string, 
  asin string
) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' 
  LOCATION '/user/maria_dev/meta_kindle_2/';

Create external table projectdb.meta_kindle_3(
  category ARRAY <string>, 
  tech1 string, 
  description ARRAY <string>, 
  fit string, 
  title string, 
  also_buy ARRAY <string>, 
  image ARRAY <string>, 
  tech2 string, 
  brand string, 
  feature ARRAY <string>, 
  rank ARRAY <string>,
  also_view ARRAY <string>, 
  details struct<release_date:string,file_size:string,print_length:string,Page_Numbers_Source_ISBN:string,Simultaneous_Device_Usage:string,publisher:string,publication_date:string,language:string,isbn_10:string, isbn_13:string,asin:string,word_wise:string,lending:string>, 
  main_cat string, 
  similar_item string, 
  date string, 
  price string, 
  asin string
) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' 
  LOCATION '/user/maria_dev/meta_kindle_3/';

Create external table projectdb.meta_kindle_4(
  category ARRAY <string>, 
  tech1 string, 
  description ARRAY <string>, 
  fit string, 
  title string, 
  also_buy ARRAY <string>, 
  image ARRAY <string>, 
  tech2 string, 
  brand string, 
  feature ARRAY <string>, 
  rank ARRAY <string>,
  also_view ARRAY <string>, 
  details struct<release_date:string,file_size:string,print_length:string,Page_Numbers_Source_ISBN:string,Simultaneous_Device_Usage:string,publisher:string,publication_date:string,language:string,isbn_10:string, isbn_13:string,asin:string,word_wise:string,lending:string>, 
  main_cat string, 
  similar_item string, 
  date string, 
  price string, 
  asin string
) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' 
  LOCATION '/user/maria_dev/meta_kindle_4/';

Create external table projectdb.meta_kindle_5(
  category ARRAY <string>, 
  tech1 string, 
  description ARRAY <string>, 
  fit string, 
  title string, 
  also_buy ARRAY <string>, 
  image ARRAY <string>, 
  tech2 string, 
  brand string, 
  feature ARRAY <string>, 
  rank ARRAY <string>,
  also_view ARRAY <string>, 
  details struct<release_date:string,file_size:string,print_length:string,Page_Numbers_Source_ISBN:string,Simultaneous_Device_Usage:string,publisher:string,publication_date:string,language:string,isbn_10:string, isbn_13:string,asin:string,word_wise:string,lending:string>, 
  main_cat string, 
  similar_item string, 
  date string, 
  price string, 
  asin string
) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' 
  LOCATION '/user/maria_dev/meta_kindle_5/';


-- Read in Kindle 
Create external table if not exists projectdb.kindle_1 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_1/';


Create external table if not exists projectdb.kindle_2 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_2/';


Create external table if not exists projectdb.kindle_3 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_3/';


Create external table if not exists projectdb.kindle_4 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_4/';


Create external table if not exists projectdb.kindle_5 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_5/';


Create external table if not exists projectdb.kindle_6 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_6/';


Create external table if not exists projectdb.kindle_7(
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_7/';


Create external table if not exists projectdb.kindle_8 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_8/';


Create external table if not exists projectdb.kindle_9 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_9/';


Create external table if not exists projectdb.kindle_10 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_10/';


Create external table if not exists projectdb.kindle_11 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_11/';


Create external table if not exists projectdb.kindle_12 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_12/';


Create external table if not exists projectdb.kindle_13 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_13/';


Create external table if not exists projectdb.kindle_14(
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_14/';


Create external table if not exists projectdb.kindle_15 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_15/';


Create external table if not exists projectdb.kindle_16 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_16/';


Create external table if not exists projectdb.kindle_17(
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_17/';


Create external table if not exists projectdb.kindle_18(
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_18/';


Create external table if not exists projectdb.kindle_19 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_19/';


Create external table if not exists projectdb.kindle_20 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_20/';


Create external table if not exists projectdb.kindle_21 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_21/';


Create external table if not exists projectdb.kindle_22 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_22/';


Create external table if not exists projectdb.kindle_23 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_23/';


Create external table if not exists projectdb.kindle_24 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_24/';


Create external table if not exists projectdb.kindle_25 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_25/';


Create external table if not exists projectdb.kindle_26 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_26/';


Create external table if not exists projectdb.kindle_27 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_27/';


Create external table if not exists projectdb.kindle_28 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
  row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_28/';


Create external table if not exists projectdb.kindle_29 (
  overall double, 
  vote string, 
  verified boolean, 
  reviewTime string, 
  reviewerid string, 
  asin string, 
  style struct<Format:string>, 
  reviewername string, 
  reviewtext string, 
  summary string, 
  unixreviewtime int) 
row format serde 'org.apache.hive.hcatalog.data.JsonSerDe' LOCATION '/user/maria_dev/kindle_29/';

