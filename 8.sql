select actor_id, first_name, last_name from actor order by last_name, first_name;
select actor_id, first_name, last_name from actor where last_name in ('WILLIAMS','DAVIS');
select customer_id from rental where date(rental_date)='2005-07-05';
select c.email, r.return_date from customer c inner join rental r on c.customer_id = r.customer_id where date(r.rental_date) = '2005-06-14' order by r.return_date desc, c.email;