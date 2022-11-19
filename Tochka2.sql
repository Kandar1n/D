select id_movie, count(review_message) from bd.reviews group by id_movie;#Кол-во комментариев к каждому фильму
select id_movie, description from bd.movies where duration > 400;#Фильмы длиной > 400
select count(*) from bd.users u;
select id_genre, count(*) from bd.movies m group by id_genre having count(*)>3;
select m.id_movie, g.genre_name from movies m inner join genres g on m.id_genre =g.id_genre;#Выводит фильмы и жанры
select m.id_movie, g.genre_name from movies m right join genres g on m.id_genre =g.id_genre;#Выводит жанры с фильмами и жанры без фильмов
select p.fullname, r.review_message from reviews r inner join users u on u.id = r.id_user inner join profile p on p.id_user = u.id where p.fullname like '%n%';
select m.id_movie, count(ra.id_movie) as 'Count of views' from movies m inner join recent_actions ra on m.id_movie = ra.id_movie group by m.id_movie;
select u.id from users u where not exists(select ra.user_id from recent_actions ra where u.id=ra.user_id);#Выводит пользователей которые выполняли последних действий
select fg.name from favourite_groups fg where fg.fav_group_id in (select f.fav_group_id from favourites f group by f.fav_group_id having count(*)>3);#Выводит название закладки с кол-вом пользователей больше 3