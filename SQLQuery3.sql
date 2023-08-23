/* Création de la base intégrer*/

create database db1

use db1


create table actor(
actor_id nvarchar(100) primary key,
actor_name nvarchar(100),
sexe nvarchar(100)
)
use db1
drop table movie

create table movie(
movie_id nvarchar(100) primary key,
movie_title nvarchar(100),
movie_year numeric,
id_magasin int,
director nvarchar(100),
release_date date,
release_price float,
writer nvarchar(100)
)

create table magasin(
id_magasin int primary key,
mart_name nvarchar(100)
)

use db1
--drop table actsin
use db1
create table actsin(
actor_id nvarchar(100),
movie_id nvarchar(100)
)

use moviemegamart
create table customer(
cust_id nvarchar(100) ,
cust_name nvarchar(100),
sexe nvarchar(100),
birthday date,
adresse nvarchar(100)
)

create table copy_rented_to(
copy_id numeric primary key,
from_date date,
to_date date,
cust_id nvarchar(100),
price_day float,
movie_id nvarchar(100),
sex nvarchar(100),
birthday date,
adresse nvarchar(100)
)

create table copy_for_rent(
copy_rend_id numeric primary key,
movie_id nvarchar(100),
copy_type nvarchar(100),
disposed nvarchar(100)
)

CREATE TABLE MSysCompactError ( 
ErrorCode nvarchar(100) primary key,
ErrorDescription nvarchar(100),
ErrorRecid nvarchar(100),
ErrorTable nvarchar(100)
)

CREATE TABLE gadget (
gadget_id numeric primary key,
cust_id nvarchar(100),
price float,
type_g nvarchar(100),
sale_date date,
title nvarchar(100),
price_sale float,
inv_date date,
adresse nvarchar(100),
brithday date,
sex nvarchar(100)
)

CREATE TABLE saleItem (
sale_item_id numeric primary key, 
movie_id nvarchar(100),
cust_id nvarchar(100),
inventory_price float,
type_movie nvarchar(100),
sale_price float,
sale_date date,
sex nvarchar(100),
soldto numeric,
adresse nvarchar(100),
brithday date
)

/* Clés étrangère */
use db1
alter table [dbo].[actsin]
add constraint FK_movie_id12 foreign key ([movie_id]) references [dbo].[movie]([movie_id])

alter table [dbo].[actsin]
add constraint FK_actor_id12 foreign key ([actor_id]) references [dbo].[actor]([actor_id])

alter table [dbo].[gadget]
add constraint FK_cust_id13 foreign key ([cust_id]) references [dbo].[customer]([cust_id])

alter table [dbo].[movie]
add constraint FK_id_magasin12 foreign key ([id_magasin]) references [dbo].[magasin]([id_magasin])

alter table [dbo].[copy_for_rent]
add constraint FK_movie_id14 foreign key ([movie_id]) references [dbo].[movie]([movie_id])

alter table [dbo].[copy_rented_to]
add constraint FK_movie_id15 foreign key ([movie_id]) references [dbo].[movie]([movie_id])

alter table [dbo].[copy_rented_to]
add constraint FK_cust_id16 foreign key ([cust_id]) references [dbo].[customer]([cust_id])

alter table [dbo].[saleItem]
add constraint FK_cust_id17 foreign key ([cust_id]) references [dbo].[customer]([cust_id])

alter table [dbo].[saleItem]
add constraint FK_movie_id58 foreign key ([movie_id]) references [dbo].[movie]([movie_id])

/* ajouter clé PK */



use metrostarlet
--delete from actor_metro where actor_id_metro is null
select * from actor_metro where actor_id_metro is null
ALTER TABLE actor_metro --ALTER COLUMN actor_id_metro numeric not null
ADD CONSTRAINT PK_actor PRIMARY KEY(actor_id_metro)

use db1
select * from actor

use db1
CREATE TABLE DUAL
(
DUMMY VARCHAR(1)
)

INSERT INTO DUAL (DUMMY)
VALUES ('X')

use db1
select * from [dbo].[customer]

use buckboster
select * from (
SELECT distinct cast(trim(actor_id) as numeric) as actor_id,
 trim(actor_name) as actor_name, trim(sexe) as sexe
from [dbo].[Actor]
where actor_id is not NULL) a 
where a.actor_id = 10006
--order by actor_id

use [db1]
select * from [dbo].[movie]
where [movie_id] = 'ME56821'


use buckboster
SELECT
  cast(price as float) as price
, cast(sale_price as float) as sale_price
, concat('BU',id) as id
, sale_date
, cust_id
, title
, type_ga
FROM gadget
where id is not null


SELECT
  concat('BU',actor_id) as actor_id
, concat('BU',movie_id) as movie_id
FROM Actsin
where actor_id is not null 
where movie_id is not null 

use moviemegamart
select * from [dbo].[movierentals_mega]



use db1
drop table



alter table [dbo].[moviesales_mega1]

use moviemegamart
SELECT
  concat('MO',cust_id) as cust_id
, cust_name
, sexe
, birthday
, adresse
FROM customer
where cust_id is not null

use moviemegamart
select * from [dbo].[moviesales_mega1]
where ref_no = 0

use moviemegamart
select * from [dbo].[customer]
where cust_id = 0

use moviemegamart
update customer
set sexe = 'Male'
WHERE sexe = 'Y'

use metrostarlet
SELECT
  production_year
, movie_title
, concat('ME',movie_id) as movie_id
, writer
, director
, release_date
, release_price
, 2 as id_magasin
FROM movie_metro
where movie_id is not null

use db1
select * from [dbo].[movie]
where id_magasin = 3

use buckboster
select * from [dbo].[movie]
where movie_id ='MN49498'

use buckboster
SELECT
  concat('BU',actor_id) as actor_id
, concat('BU',movie_id) as movie_id
FROM Actsin
where actor_id not in (select actor_id from Actor)

use db1
select * from actsin

use buckboster
--delete from Actsin where movie_id is null
SELECT
  concat('BU',actor_id) as actor_id
, concat('BU',movie_id) as movie_id
FROM Actsin

use buckboster
SELECT
  price
, sale_price
, id
, sale_date
, concat('BU',cust_id) as cust_id
, title
, type_ga
FROM gadget
where id is not null

use moviemegamart
SELECT
  g.ref_no
, g.sale_date
, concat('MO',c.cust_id) as cust_id
, cast(g.sex_male as nvarchar(100)) as sex_male
, g.birthdate
, g.price_sale
, g.addresse
, g.gadget_type
, g.inv_date
, g.inv_price
, g.gadget_title
FROM gadgetsales_mega g,customer c 
where upper(trim(g.cust_name)) = upper(trim(c.cust_name)) and ref_no is not null

use db1
select * from gadget where cust_id like '%MO%'