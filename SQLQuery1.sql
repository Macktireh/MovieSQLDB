create database buckboster

USE buckboster

CREATE TABLE Actor
(
actor_id nvarchar(30),
actor_name nvarchar(50),
sexe nvarchar(10)
)


CREATE TABLE Actsin
(
actor_id nvarchar(30),
movie_id nvarchar(30)   
)


CREATE TABLE Customer
(
cust_id nvarchar(30),
firstname nvarchar(50),
lastname nvarchar(50),
dat date,
sexe nvarchar(10)
)

CREATE TABLE gadget
(
id int,
cust_id nvarchar(30),
type_ga nvarchar(20),
price int,
sale_price int,
sale_date date,
title nvarchar(50)
)


CREATE TABLE movie
(
movie_id nvarchar(30),
movie_title nvarchar(50),
movie_year int
)

CREATE TABLE MSysCompactError
(
Error_Code real,
Error_Description nvarchar(100),
Error_Recid binary,
Error_Table nvarchar(20)
)

CREATE TABLE sale_item
(
id int,
type_sale_item nvarchar(30),
inventory_price int,
sale_price int,
movie_id nvarchar(30),
sale_date date,
cust_id nvarchar(30)
)

select * from [dbo].[sale_item]
------- Clé étrangère

alter table [dbo].[Actsin]
add constraint FK_movie_id1lk foreign key ([movie_id]) references [dbo].[movie]([movie_id])

alter table [dbo].[Actsin]
add constraint FK_actor_idij foreign key ([actor_id]) references [dbo].[Actor]([actor_id])

alter table [dbo].[gadget]
add constraint FK_cust_id_gad2 foreign key ([cust_id]) references [dbo].[Customer]([cust_id])

alter table [dbo].[sale_item]
add constraint FK_movie_id3 foreign key ([movie_id]) references [dbo].[movie]([movie_id])

alter table [dbo].[sale_item]
add constraint FK_cust_id3 foreign key ([cust_id]) references [dbo].[Customer]([cust_id])


create database metrostarlet

USE metrostarlel

CREATE TABLE actor_metro
(
actor_id_metro int,
actor_name_metro nvarchar(50),
)


CREATE TABLE actsin_metro
(
actor_id_metro int,
movie_id_metro int   
)


CREATE TABLE customer_metro
(
cust_id_metro int,
name_metro nvarchar(50),
middlename_metro nvarchar(50),
surname_metro nvarchar(50),
birthday_metro date,
gender_metro nvarchar(10),
address_metro nvarchar(100)
)

CREATE TABLE copy_for_rent_metro
(
id_metro int,
movie_id_metro int,
copy_type_metro nvarchar(50),
disposed_metro real
)


CREATE TABLE copy_for_sale_metro
(
id_metro int,
copy_type_metro nvarchar(50),
is_new_metro real,
sale_price_metro int,
sale_date_metro date,
movie_id_metro int,
soldto_metro int
)

CREATE TABLE copy_rented_to_metro
(
from_date_metro date,
to_date_metro date,
price_day_metro int,
copy_id_metro int,
cust_id_metro int
)

CREATE TABLE movie_metro
(
production_year int,
movie_title nvarchar(50),
movie_id int,
writer nvarchar(50),
director nvarchar(50),
release_date date,
release_price real
)