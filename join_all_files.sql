create table projectdb.meta_kindle_all
as
with q1 as(
 	select a.* from meta_kindle_1 a 
	union all 
	select b.* from meta_kindle_2 b
	union all 
	select c.* from meta_kindle_3 c
	union all 
	select d.* from meta_kindle_4 d
	union all 
	select e.* from meta_kindle_5 e
)
select * from q1;


create table projectdb.kindle_all
as
with q1 as(
 	select a1.* from kindle_1 a1 
	union all 
	select a2.* from kindle_2 a2
	union all 
	select a3.* from kindle_3 a3
	union all 
	select a4.* from kindle_4 a4
	union all 
	select a5.* from kindle_5 a5
	union all
	select a6.* from kindle_6 a6 
	union all 
	select a7.* from kindle_7 a7
	union all 
	select a8.* from kindle_8 a8
	union all 
	select a9.* from kindle_9 a9
	union all 
	select a10.* from kindle_10 a10
	union all
	select a11.* from kindle_11 a11 
	union all 
	select a12.* from kindle_12 a12
	union all 
	select a13.* from kindle_13 a13
	union all 
	select a14.* from kindle_14 a14
	union all 
	select a15.* from kindle_15 a15
	union all
	select a16.* from kindle_16 a16 
	union all 
	select a17.* from kindle_17 a17
	union all 
	select a18.* from kindle_18 a18
	union all 
	select a19.* from kindle_19 a19
	union all 
	select a20.* from kindle_20 a20
	union all
	select a21.* from kindle_21 a21 
	union all 
	select a22.* from kindle_22 a22
	union all 
	select a23.* from kindle_23 a23
	union all 
	select a24.* from kindle_24 a24
	union all 
	select a25.* from kindle_25 a25
	union all
	select a26.* from kindle_26 a26 
	union all 
	select a27.* from kindle_27 a27
	union all 
	select a28.* from kindle_28 a28
	union all 
	select a29.* from kindle_29 a29
)
select * from q1;
