SELECT * FROM pizza.orders;
use pizza;
create table orders(
order_id int primary key,
order_date date not null,
order_time time not null
);


create table order_details(
order_details_id int primary key,
order_id int not null,
pizza_id varchar(100) not null,
quantity int not null
);

select count(order_id) as no_of_orders
from orders;

select sum(price*quantity)
from pizzas as p
inner join order_details as od
on p.pizza_id=od.pizza_id;

select max(price)
from pizzas;

select pizza_id as p, count(quantity) as c
from order_details
group by p
order by c desc limit 5;

select size as s, count(quantity) as c
from order_details as od
join pizzas as p
on od.pizza_id=p.pizza_id
group by s
order by c desc limit 1;

select category as c, sum(quantity) as q
from pizzas as p
join pizza_types as t
on p.pizza_type_id=t.pizza_type_id
join order_details as od
on p.pizza_id=od.pizza_id
group by c
order by q desc;

select hour(order_time) as o, sum(quantity) as q
from orders as os
join order_details as od
on os.order_id=od.order_id
group by o
order by q desc;

select hour(order_time) as o, count(order_id) as c
from orders as os
group by o
order by c desc;

select category as c, count(order_id) as o
from pizzas as p
join pizza_types as t
on p.pizza_type_id=t.pizza_type_id
join order_details as od
on p.pizza_id=od.pizza_id
group by c
order by o desc;

select avg(q) from 
(select order_date, sum(quantity) as q
from orders as o
join order_details as od
on o.order_id=od.order_id
group by o.order_date) as order_quantity;

select name as n, sum(quantity*price) as r
from pizzas as p
join pizza_types as t
on p.pizza_type_id=t.pizza_type_id
join order_details as od
on p.pizza_id=od.pizza_id
group by n
order by r desc limit 3;