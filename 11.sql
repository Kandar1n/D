use sakila;
#A union B: {L,M,N,O,P,Q,R,S,T}
#A union all B: {L,M,N,O,P,P,Q,R,S,T}
#A intersect B: {P}
#A except B: {L,M,N,O}
select "Actor" typ, a.first_name, a.last_name from actor a where last_name like 'L%' 
union all
select "Customer" typ, c.first_name, c.last_name from customer c where last_name like 'L%' order by last_name;#6.2 и 6.3