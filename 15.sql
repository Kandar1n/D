use sakila;
select c.first_name, p.amount from customer c inner join payment p on p.customer_id = c.customer_id;
select c.first_name, p.amount from customer c right join payment p on p.customer_id = c.customer_id;
select c.first_name, p.amount from customer c left join payment p on p.customer_id = c.customer_id;
use bd;
select m.id_movie, g.genre_name from movies m inner join genres g on m.id_genre =g.id_genre;#Выводит фильмы и жанры
select m.id_movie, g.genre_name from movies m right join genres g on m.id_genre =g.id_genre;#Выводит жанры с фильмами и жанры без фильмов