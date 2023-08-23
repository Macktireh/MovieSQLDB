select row_number() over() as rent_id, r.* from (

(SELECT r.id_metro as id, r.movie_id_metro, r.copy_type_metro,rc.cust_id,r.disposed_metro,'metro' as categ FROM metrostarlet.copy_for_rent_metro r 
left outer join (select copy_id_metro,max(cust_id_metro) as cust_id  from metrostarlet.copy_rented_to_metro group by copy_id_metro) rc on r.id_metro=rc.copy_id_metro) me
union all
SELECT m.ref_no as id,m.movie_id,cast('movie' as text) as type_rent,c.cust_id,cast(null as boolean) as disposed_metro,'mega' as categ FROM moviemegamart.movierentals_mega m,dbcentrale.customer c,
(select * from dbcentrale.movie c where c.id_magasin = 3) me 
where c.cust_name = m.cust_name and c.id_magasin = 3 and m.movie_id = me.id
) r

select sum(id) from (
select copy_id_metro,count(*) as id from (

SELECT from_date_metro, to_date_metro, price_day_metro, copy_id_metro,cust_id_metro FROM metrostarlet.copy_rented_to_metro


select c.* from dbcentrale.customer c,moviemegamart.movierentals_mega m where c.cust_name = m.cust_name and c.id_magasin = 3

select * from dbcentrale.customer c where c.id_magasin = 2
delete from dbcentrale.movie c where c.id_magasin = 3
-- 96768
insert into 
select row_number() over()+121816 as movie_id,id,id_magasin from (
select distinct movie_id as id, 3 as id_magasin from (
select movie_id from moviemegamart.movierentals_mega
union all
select movie_id from moviemegamart.moviesales_mega) m ) m

select  r.* from (
select r.rent_id,m.movie_id,m.date_from,m.date_to,m.cust_id,m.price_rent from 
(SELECT m.ref_no,m.movie_id,m.date_from,m.date_to,c.cust_id,m.price_rent,cast('mega' as text) as categ  FROM moviemegamart.movierentals_mega m,dbcentrale.customer c 
where c.cust_name = m.cust_name and c.id_magasin = 3) m, dbcentrale.rent r where m.ref_no = r.id and r.categ = 'mega'
union all
select r.rent_id,m.movie_id_metro,m.from_date_metro,m.to_date_metro,m.cust_id_metro,m.price_day_metro from
(SELECT rc.copy_id_metro,r.movie_id_metro,rc.from_date_metro,rc.to_date_metro,rc.cust_id_metro,rc.price_day_metro,'metro' as categ FROM metrostarlet.copy_for_rent_metro r,metrostarlet.copy_rented_to_metro rc
where r.id_metro=rc.copy_id_metro) m,dbcentrale.rent r where m.copy_id_metro = r.id and r.categ = 'metro'
) r

select * from moviemegamart.movierentals_mega where movie_id = 121517 not in (select id from dbcentrale.rent where categ = 'mega')

select count(*) FROM metrostarlet.copy_for_rent_metro r where cust_id is null left outer join 

(select copy_id_metro,max(cust_id_metro) as cust_id  from metrostarlet.copy_rented_to_metro group by copy_id_metro) rc on r.id_metro=rc.copy_id_metro

group by copy_id_metro having count(*)>1








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%










select movie_id,movie_title,director,release_date from dbcentrale.movie

create table dbetoile.produit (
movie_id numeric primary key,
movie_title character varying(150),
director character varying(150),
release_date date
)

select a.actor_id,a.actor_name,sexe from dbcentrale.actor a,dbcentrale.actsin ac,dbcentrale.movie m where a.actor_id = ac.actor_id and ac.movie_id = m.movie_id

create table dbetoile.actor (
actor_id numeric primary key,
actor_name character varying(150),
sexe character varying(10)
)

select cust_id,cust_name,sexe,birthday,adresse from dbcentrale.customer

create table dbetoile.client (
cust_id numeric primary key,
cust_name character varying(150),
sexe character varying(1),
birthday date,
adresse character varying(150)
)


select id_magasin,mag_name from dbcentrale.magasin

create table dbetoile.magasin (
id_magasin integer primary key,
mag_name character varying(150)
)


select row_number () over () as id_tps,sale_date from (
select distinct sale_date from dbcentrale.sale where sale_date is not null
) s order by sale_date

create table dbetoile.periode_vente (
id_tps numeric primary key,
sale_date date
)

select row_number () over () as id_tps,date_from from (
select distinct date_from from dbcentrale.rent r,dbcentrale.rent_movi rm where r.rent_id = rm.rent_id
) s order by date_from

create table dbetoile.periode_debut (
id_tps numeric primary key,
date_from date
)

select rent_id,type_copy from dbcentrale.rent

create table dbetoile.location_m (
rent_id numeric primary key,
type_copy character varying
)

select sale_id,type_sale from dbcentrale.sale

create table dbetoile.vente (
sale_id numeric primary key,
type_sale character varying
)

select gadget_id,type_gadget,title,sale_date from dbcentrale.gadget

create table dbetoile.gadget (
gadget_id numeric primary key,
type_gadget character varying,
title character varying,
sale_date date
)
