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






