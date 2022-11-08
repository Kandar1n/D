use sakila;
select c.first_name, c.last_name, a.address, ct.city from customer c inner join address a on c.address_id = a.address_id inner join city ct on a.city_id = ct.city_id where a.district = 'California';
select f.title from film f inner join film_actor fa on f.film_id = fa.film_id inner join actor a on a.actor_id = fa.actor_id where a.first_name = 'JOHN';
select distinct a.address, a1.address from address a inner join address a1 on a.city_id = a1.city_id where a.address <> a1.address;
use nikitabd;
select p.fullname, r.review_message from reviews r inner join users u on u.id = r.id_user inner join profile p on p.id_user = u.id where p.fullname like '%n%';
select m.id_movie, count(ra.id_movie) as 'Count of views' from movies m inner join recent_actions ra on m.id_movie = ra.id_movie group by m.id_movie;
select
	u.id
from
	subscription s
inner join users_has_subscription uhs on
	s.id_subscription = uhs.subscription_id
inner join users u on
	u.id = uhs.user_id
where
	s.id_subscription = (
	select
		s.id_subscription
	where
		datediff(adddate(date(s.date_of_activate), s.duration), date('2022-10-27')) > 0);