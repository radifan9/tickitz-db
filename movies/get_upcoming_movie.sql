select
  m.title,
  m.synopsis,
  m.poster_img,
  m.backdrop_img,
  m.duration_minutes,
  m.release_date,
  p.name as director_name
from
  movies m
  inner join people p on m.id = p.id
where
  release_date > current_date;