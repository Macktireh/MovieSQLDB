create database etl
use etl
create table customer(
cust_id numeric primary key,
cust_name nvarchar(150),
sexe nvarchar(5),
birthday date,
adresse nvarchar(150)
)

use etl
create table magasin (
id_magasin integer primary key,
mag_name nvarchar(150)
)

use etl
create table movie (
movie_id numeric primary key,
movie_title character varying(150),
director nvarchar(150),
release_date date
)

use etL
create table periode (
id_tps numeric primary key,
date_from date,
sale_date date
)

use etl
CREATE TABLE evolution_sale_rent
(
  movie_id numeric,
  id_magasin integer,
  cust_id numeric,
  id_tps numeric,
  sale_price real,
  type_sale nvarchar(150),
  CONSTRAINT fk_cust FOREIGN KEY (cust_id)REFERENCES customer (cust_id),
  CONSTRAINT fk_mag FOREIGN KEY (id_magasin) REFERENCES magasin (id_magasin),
  CONSTRAINT fk_mov FOREIGN KEY (movie_id) REFERENCES movie (movie_id),
  CONSTRAINT fk_tps FOREIGN KEY (id_tps) REFERENCES periode (id_tps)
)