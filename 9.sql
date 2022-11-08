select * from sakila.payment where amount in (1.98,7.98,9.98);
select * from sakila.customer where last_name like '_A%w%';
select id_movie, count(review_message) from nikitabd.reviews group by id_movie;#Кол-во комментов к каждому фильму
select id_movie, description from nikitabd.movies where duration > 400;#Фильмы длиной больше 400
select ra.user_id, ra.time from nikitabd.recent_actions ra order by ra.time desc limit 1;#Пользователь с наибольшим временем просмотра но работает не очень