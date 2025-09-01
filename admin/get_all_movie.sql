-- This query will be used in admin dashboard movie
select
  m.id,
  m.poster_img as thumbnail,
  m.title,
  string_agg(g.name, ', ') as category,
  m.release_date,
  m.duration_minutes
from
  movies m
  join movie_genres mg on m.id = mg.movie_id
  join genre g on mg.genre_id = g.id
group by
  m.id,
  m.poster_img,
  m.release_date,
  m.duration_minutes
limit
  10 offset 0;