/* Création de la base intégrer*/

create database base_int

use base_int

create table actor(
actor_id int primary key,
actor_name nvarchar(100),
sexe nvarchar(15)
)

create table movie(
movie_id int primary key,
movie_title nvarchar(100),
movie_year int,
Production_year int,
id_mart int,
sale_date date,
Price_sale int,
release_date date,
release_price float,
writer nvarchar(100)
)

create table mart(
id_mart int primary key,
mart_name nvarchar(100)
)

create table actsin(
actor_id int primary key,
movie_id int
)

create table moviecopy(
id int primary key,
inv_date date,
inv_price int,
movie_type nvarchar(100),
movie_title nvarchar(100),
year_of_movie int,
writer nvarchar(100),
directory nvarchar(100),
rentable int
)

create table customer(
cust_id nvarchar(100) primary key,
names nvarchar(25),
middlename nvarchar(25),
surname nvarchar(25),
sexe char(2),
birthday date,
adresse nvarchar(25),
firstname nvarchar(25)
)

create table copy_rented_to(
copy_id numeric(10) primary key,
from_date date,
to_date date,
birthday float(8)
)

create table copy_for_rent(
copy_rend_id numeric(10) primary key,
copy_type nvarchar(10),
disposed nvarchar(2)
)

create table copy_for_sale (
copy_sale_id numeric(10) primary key,
copy_type nvarchar(10),
is_new nvarchar(100),
sale_date date,
sale_price float,
sold_to date
)

CREATE TABLE MSysCompactError ( 

ErrorCode numeric(10) primary key,
ErrorDescription nvarchar(50),
ErrorRecid numeric (10),
ErrorTable nvarchar(50)

)

CREATE TABLE movieRentals (

movierentals_id numeric (10) primary key,
date_to date,
date_from date,
ref_no numeric(10),
price_rent float (10)
)

CREATE TABLE gadget (

gadget_id numeric (10) primary key,
price float(10),
type nvarchar(15),
sale_date date,
title nvarchar(50),
price_sale float(10)

)

CREATE TABLE saleItem (

sale_item_id numeric(10) primary key, 
inventory_price float(10),
type nvarchar(15),
sale_price float,
sale_date date
)