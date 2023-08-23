create database dbcentrale
use dbcentrale
CREATE TABLE actor
(
  actor_id numeric NOT NULL,
  actor_name nvarchar(100),
  sexe nvarchar(100),
  CONSTRAINT actor_pkey PRIMARY KEY (actor_id)
)

CREATE TABLE magasin
(
  id_magasin integer NOT NULL,
  mart_name nvarchar(100),
  CONSTRAINT magasin_pkey PRIMARY KEY (id_magasin)
)
/*
use dbcentrale
select row_number () over (order by sale_date) as id_tps,sale_date from (
select distinct sale_date from sale where sale_date is not null
) s order by sale_date

use dbcentrale
--select rent_id,type_copy from rent
select row_number () over (order by date_from) as id_tps,date_from from (
select distinct date_from from rent r,rent_movi rm where r.rent_id = rm.rent_id
) s order by date_from*/
CREATE TABLE customer
(
  cust_id numeric NOT NULL,
  cust_name nvarchar(100),
  sexe nvarchar(10),
  birthday date,
  adresse nvarchar(150),
  id_magasin integer,
  CONSTRAINT customer_pkey PRIMARY KEY (cust_id),
  CONSTRAINT fk_mag FOREIGN KEY (id_magasin) REFERENCES magasin (id_magasin) 
)

CREATE TABLE movie
(
  movie_id numeric NOT NULL,
  movie_title nvarchar(150),
  movie_year numeric,
  id_magasin integer,
  director nvarchar(100),
  release_date date,
  release_price real,
  writer nvarchar(100),
  CONSTRAINT movie_pkey PRIMARY KEY (movie_id),
  CONSTRAINT fk_mag1 FOREIGN KEY (id_magasin) REFERENCES magasin (id_magasin) 
)

CREATE TABLE gadget
(
  gadget_id numeric NOT NULL,
  cust_id numeric,
  type_gadget nvarchar(100),
  price real,
  sale_price real,
  sale_date date,
  title nvarchar(150),
  inv_date date,
  CONSTRAINT pk_gad PRIMARY KEY (gadget_id),
  CONSTRAINT "FK_cust" FOREIGN KEY (cust_id) REFERENCES customer (cust_id)
)

CREATE TABLE actsin
(
  actor_id numeric,
  movie_id numeric,
  CONSTRAINT fk_act FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
  CONSTRAINT fk_mov FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
)

CREATE TABLE rent
(
  rent_id numeric NOT NULL,
  movie_id numeric,
  type_copy nvarchar(100),
  disposed_metro nvarchar(5),
  categ nvarchar(150),
  cust_id numeric,
  CONSTRAINT pk_rent PRIMARY KEY (rent_id),
  CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
)

CREATE TABLE rent_movi
(
  rent_id numeric,
  movie_id numeric,
  date_from date,
  date_to date,
  cust_id numeric,
  price real)
)

alter table [dbo].[rent_movi]
add CONSTRAINT fk_cust2 FOREIGN KEY (cust_id) REFERENCES customer (cust_id)
alter table [dbo].[rent_movi]
add CONSTRAINT fk_movie2 FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
alter table [dbo].[rent_movi]
add CONSTRAINT fk_rent2 FOREIGN KEY (rent_id) REFERENCES rent (rent_id)

CREATE TABLE sale
(
  sale_id numeric NOT NULL,
  type_sale nvarchar(150),
  inv_price real,
  sale_price real,
  movie_id numeric,
  sale_date date,
  cust_id numeric,
  is_new_metro nvarchar(5),
  CONSTRAINT sale_pkey PRIMARY KEY (sale_id),
  CONSTRAINT fk_cust3 FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
  CONSTRAINT fk_movie3 FOREIGN KEY (movie_id) REFERENCES movie (movie_id)
)


select * from [dbo].[rent_movi]

------------------------------------------------------------------------------------

create database etoile
use dbcentrale
select movie_id,movie_title,director,release_date from movie

use etoile
create table produit (
movie_id numeric primary key,
movie_title character varying(150),
director nvarchar(150),
release_date date
)

select a.actor_id,a.actor_name,sexe from actor a,actsin ac,movie m where a.actor_id = ac.actor_id and ac.movie_id = m.movie_id

use etoile
create table actor (
actor_id numeric primary key,
actor_name nvarchar(150),
sexe nvarchar(10)
)

select cust_id,cust_name,sexe,birthday,adresse from customer

use etoile
create table client (
cust_id numeric primary key,
cust_name nvarchar(150),
sexe nvarchar(5),
birthday date,
adresse nvarchar(150)
)

select id_magasin,mag_name from magasin

use etoile
create table magasin (
id_magasin integer primary key,
mag_name nvarchar(150)
)


select row_number () over () as id_tps,sale_date from (
select distinct sale_date from sale where sale_date is not null
) s order by sale_date

use etoile
create table periode_vente (
id_tps numeric primary key,
sale_date date
)

select row_number () over () as id_tps,date_from from (
select distinct date_from from rent r,rent_movi rm where r.rent_id = rm.rent_id
) s order by date_from

use etoile
create table periode_debut (
id_tps numeric primary key,
date_from date
)

select rent_id,type_copy from rent

use etoile
create table location_m (
rent_id numeric primary key,
type_copy nvarchar(150)
)

select sale_id,type_sale from sale

use etoile
create table vente (
sale_id numeric primary key,
type_sale nvarchar(150)
)

select gadget_id,type_gadget,title,sale_date from gadget

use etoile
create table gadget (
gadget_id numeric primary key,
type_gadget nvarchar(150),
title nvarchar(150),
sale_date date
)
use etoile
CREATE TABLE evolution_sale_rent
(
  movie_id numeric,
  id_magasin integer,
  cust_id numeric,
  rent_id numeric,
  sale_id numeric,
  id_tps_rent numeric,
  id_tps_sale numeric,
  sale_price real,
  CONSTRAINT fk_cust FOREIGN KEY (cust_id)REFERENCES client (cust_id),
  CONSTRAINT fk_mag FOREIGN KEY (id_magasin) REFERENCES magasin (id_magasin),
  CONSTRAINT fk_mov FOREIGN KEY (movie_id) REFERENCES produit (movie_id),
  CONSTRAINT fk_rent FOREIGN KEY (rent_id) REFERENCES location_m (rent_id),
  CONSTRAINT fk_sale FOREIGN KEY (sale_id) REFERENCES vente (sale_id),
  CONSTRAINT fk_tps_rent FOREIGN KEY (id_tps_rent) REFERENCES periode_louer (id_tps),
  CONSTRAINT fk_tps_sale FOREIGN KEY (id_tps_sale) REFERENCES periode_vente (id_tps)
)

use etoile
select * from [dbo].[evolution_sale_rent]

-- Q1 Quel est par produits, le montant mensuel des ventes ?
use etoile
select produit,mois,annee,sum(montant) as montant_total from (
select p.type_sale as produit,concat(concat(datepart(month,v.sale_date),' => '),upper(format(v.sale_date,'MMMM'))) as mois,datepart(year,v.sale_date) as annee,f.sale_price as montant from vente p, evolution_sale_rent f,periode_vente v
where p.sale_id = f.sale_id and f.id_tps_sale = v.id_tps
) p group by produit,mois,annee
order by annee,mois

-- Q2 Quels est l'âge moyen des clients(hommes, femmes) qui louent des films ?
use etoile
select c.sexe,avg(age) as age from (
select distinct cl.cust_id,cl.sexe,DATEDIFF(year,birthday,dt) as age,f.movie_id,f.rent_id from (
select cust_id,sexe,birthday,CONVERT(date, getdate())as dt from client) cl, evolution_sale_rent f
where cl.cust_id = f.cust_id
) c group by c.sexe

-- Q3 Quels sont par magasins les films les plus vendus ?
use etoile
select  magasin, film, count(*) as nb_vente from(
select mag_name as magasin,p.movie_title as film from magasin m, evolution_sale_rent f,vente v,produit p
where m.id_magasin = f.id_magasin and f.sale_id = v.sale_id and f.movie_id = p.movie_id
) d group by film, magasin
order by nb_vente desc 

-- Q4 En termes de nombres de films loués par mois, quels sont les mois pour lesquels une baisse de moins de 15% par rapport aux mois precedents a été constaté
use etoile
select mois, annee,100*(count(*) - lag(count(*)) OVER (Order By annee,mois))/lag(count(*)) OVER (Order By annee,mois) as baisse from (
select p.movie_id,concat(concat(datepart(month,pl.date_from),' => '),upper(format(pl.date_from,'MMMM'))) as mois,datepart(year,pl.date_from) as annee from produit p, evolution_sale_rent f, periode_louer pl, location_m lm
where f.id_tps_rent = pl.id_tps and f.rent_id = lm.rent_id and f.movie_id = p.movie_id
) h group by mois, annee order by annee, mois



SELECT mois, 100*( count(LAG(Event.Type,1,0) OVER (Order By DATEFROMPART (Periode.Mois, Periode.année) - Count(Event.Type) )) /  count(LAG(Event.Type,1,0) OVER (Order By DATEFROMPART (Periode.Mois, Periode.année))) as Variation
From Periode, Event
Where Periode.Id = Event.Id AND
Event.Type = 2 
GROUP BY Periode.mois, Periode.année
Having Variation >15



---- etoile donnée
--select movie_id,movie_title,director,release_date from dbcentrale.movie

--select distinct a.actor_id,a.actor_name,a.sexe from dbcentrale.actor a,dbcentrale.actsin ac,dbcentrale.movie m where a.actor_id = ac.actor_id and ac.movie_id = m.movie_id

--select cust_id,cust_name,sexe,birthday,adresse from dbcentrale.customer

--select id_magasin,mag_name from dbcentrale.magasin

/*select row_number () over () as id_tps,sale_date from (
select distinct sale_date from dbcentrale.sale where sale_date is not null
) s order by sale_date*/

/*select row_number () over () as id_tps,date_from from (
select distinct date_from from dbcentrale.rent r,dbcentrale.rent_movi rm where r.rent_id = rm.rent_id
) s order by date_from*/

--select rent_id,type_copy from dbcentrale.rent

--select sale_id,type_sale from dbcentrale.sale

--select gadget_id,type_gadget,title,sale_date from dbcentrale.gadget

--select count(*) from (

--select gadget_id,cust_id from dbcentrale.gadget

--select distinct ac.movie_id,a.actor_id from dbcentrale.actor a,dbcentrale.actsin ac,dbcentrale.movie m where a.actor_id = ac.actor_id and ac.movie_id = m.movie_id


select M.movie_id,M.rent_id,M.cust_id,M.id_tps_rent,S.sale_id,S.id_tps as id_tps_sale,sa.sale_price from
(select m.movie_id,R.rent_id,R.cust_id,R.id_tps as id_tps_rent from
(select movie_id from dbcentrale.movie) m,

(select r.rent_id,r.movie_id,r.cust_id,tr.id_tps from
(select distinct r.rent_id,r.movie_id,rm.cust_id from dbcentrale.rent r, dbcentrale.rent_movi rm where r.rent_id = rm.rent_id) r,
(select distinct t.id_tps,r.rent_id from dbetoile.periode_debut t,dbcentrale.rent r,dbcentrale.rent_movi rm where t.date_from = rm.date_from and r.rent_id = rm.rent_id)
tr where r.rent_id = tr.rent_id) R where m.movie_id = R.movie_id
) M,

(select s.sale_id,movie_id,cust_id,ts.id_tps from
(select sale_id,movie_id,cust_id from dbcentrale.sale) s,
(select distinct t.id_tps,s.sale_id from dbetoile.periode_vente t,dbcentrale.sale s where t.sale_date = s.sale_date)ts 
where ts.sale_id = s.sale_id) S,dbcentrale.sale sa where M.movie_id = S.movie_id and S.sale_id = sa.sale_id 

