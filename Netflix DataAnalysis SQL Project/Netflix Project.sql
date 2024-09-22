select type, count(type) as count
from netflix
group by type
order by count desc;

select type,max(rating) as rat, count(rating) as count
from netflix
group by type
order by count desc;

select t,r,c
from
(select t,r,c, rank() over(partition by t order by c desc) as rn
from
(select type as t, rating as r, count(rating) as c
from netflix
group by t,r) as a) as b
where rn=1;

select title
from netflix as n
where n.type='Movie' and release_year=2020;

select 
	unnest(STRING_TO_ARRAY(country, ', ')) as new_country, count(show_id) as count
from netflix
where country is not null
group by new_country
order by count desc limit 5;

select title, duration
from netflix as n
where n.type='Movie' and duration is not null
order by split_part(duration,' ',1)::INT DESC limit 1;

select title, date_added
from netflix
where to_date(date_added,'Month DD,YYYY')>= current_date - interval '5 years';

select director,type, title
from netflix
where director LIKE '%Rajiv Chilaka%';

select title, type, duration
from netflix as n
where n.type='TV Show' AND split_part(duration,' ',1)::INT >5;

select
	unnest(STRING_TO_ARRAY(listed_in,', ')) as genre, count(show_id) as c
from netflix
where listed_in is not null
group by genre
order by c desc;

select extract(year from to_date(date_added,'Month DD,YYYY')) as year, count(show_id) as c
from netflix
where country='India'
group by year
order by c desc;

select title
from netflix
where listed_in LIKE '%Documentaries%';

select title
from netflix
where director is null;

select n.type,title,casts
from netflix as n
where casts LIKE '%Salman Khan%' and n.type='Movie';

With new_table
as
(
select *, 
	case 
	when
		description ilike '%kill%' or 
		description ilike '%violence%' 
		Then 'Bad'
		else 'Good'
	END Category
from netflix)
Select Category, count(show_id) as total_count
From new_table
group by category;