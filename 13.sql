use sakila;
select count(*) from payment;
select customer_id, count(*), sum(amount) from payment group by customer_id ;
select customer_id, count(*), sum(amount) from payment group by customer_id having count(*)>40;
use bd;
select count(*) from bd.users u;
select id_genre, count(*) from bd.movies m group by id_genre having count(*)>3;