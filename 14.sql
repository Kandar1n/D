use sakila;
select f.film_id from film f where f.film_id in (select fc.film_id from category c inner join film_category fc on fc.category_id = c.category_id  where c.name = 'Action');
select f.film_id from film f where f.film_id = (select fc.film_id from category c inner join film_category fc on fc.category_id = c.category_id  where c.name = 'Action' and fc.film_id = f.film_id);
select 'Hollywood Star' level, fa.actor_id as actor, (select count(*) from film_actor group by actor_id having actor_id = fa.actor_id) as count from film_actor fa where fa.actor_id in (select actor_id from film_actor group by actor_id having count(*)>=30)
union 
select 'Prolific Actor' level, fa.actor_id as actor, (select count(*) from film_actor group by actor_id having actor_id = fa.actor_id) as count  from film_actor fa where fa.actor_id in (select actor_id from film_actor group by actor_id having count(*)>=20 and count(*)<=29)
union
select 'Newcomer' level, fa.actor_id as actor, (select count(*) from film_actor group by actor_id having actor_id = fa.actor_id) as count  from film_actor fa where fa.actor_id in (select actor_id from film_actor group by actor_id having count(*)>=1 and count(*)<=19);
use bd;
select u.id from users u where not exists(select ra.user_id from recent_actions ra where u.id=ra.user_id);#выводит поользователей без последних действий
select fg.name from favourite_groups fg where fg.fav_group_id in (select f.fav_group_id from favourites f group by f.fav_group_id having count(*)>3);#выводит название закладки с кол-вом пользователем больше 3