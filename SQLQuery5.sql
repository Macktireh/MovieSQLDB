/****** Script de la commande SelectTopNRows à partir de SSMS  ******/
SELECT TOP (1000) [actor_name]
      ,[actor_id]
      ,[sexe]
  FROM [buckboster].[dbo].[Actor]

  USE metrostarlet
  SELECT
  cust_id_metro
, name_metro
, middlename_metro
, surname_metro
, birthday_metro
, gender_metro
, address_metro
FROM customer_metro

use base_int
select * from [dbo].[actor]

use [metrostarlet]
select * from [dbo].[actor_metro]
where actor_id_metro = 100009

use [metrostarlet]
DELETE FROM [dbo].[actor_metro]
WHERE actor_id_metro = 63306

use data_base
select * from [dbo].[actor]
where actor_id = 100009

use db1
ALTER TABLE [dbo].[gadget]
ALTER COLUMN [gadget_id] nvarchar(100)

use [buckboster]
SELECT
actor_name, concat('BU',actor_id) as actor_id
, sexe
FROM Actor
where actor_id is not null

use metrostarlet
SELECT
  concat('ME',cust_id_metro) as cust_id_metro
, name_metro
, middlename_metro
, surname_metro
, birthday_metro
, gender_metro
, address_metro
FROM customer_metro
where cust_id_metro is not null
SELECT
  concat('ME',actor_id_metro) as actor_id_metro
, actor_name_metro
FROM actor_metro
where actor_id_metro is not null

use [buckboster]
SELECT
  firstname
, lastname
, concat('BU',cust_id) as cust_id
, dat
, sexe
FROM Customer
where cust_id is not null
SELECT
  movie_title
, concat('BU',movie_id) as movie_id
, movie_year
FROM movie
where movie_id is not null

SELECT
  production_year
, movie_title
, concat('ME',movie_id) as movie_id
, writer
, director
, release_date
, release_price
FROM movie_metro

use db1
select * from [dbo].[MSysCompactError]

use buckboster
select * from [dbo].[MSysCompactError]

use metrostarlet
select * from [dbo].[copy_for_rent_metro]

use buckboster
select * from [dbo].[movie]
wher

use buckboster
select * from [dbo].[Actsin]
where  movie_id not in (select movie_id from movie) 

use moviemegamart
select * from [dbo].[movierentals_mega]

use db1 
select * from actsin where movie_id not in (select movie_id from movie)

use metrostarlet
select * from [dbo].[actsin_metro]
where  actor_id_metro not in (select actor_id_metro from actor_metro) 



use moviemegamart
select distinct movie_id from [dbo].[movierentals_mega]
where [movie_id] = '56877'