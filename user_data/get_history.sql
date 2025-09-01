-- This query used in 'Order History' page, where user search for their order history
-- First search the user_id
select
  t.schedule_id, m.title, s.show_date, 
  s.city_id, c.name as city, 
  s.show_time_id, tm.show_time, 
  s.cinema_id, cine.name,
  m.age_rating_id, cat.age_rating
from
  transactions t
join
  schedules s on t.schedule_id = s.id
join
  movies m on s.movie_id = m.id
join
  cities c on s.city_id = c.id
join 
  show_time tm on s.show_time_id = tm.id
join
  cinemas cine on s.cinema_id = cine.id
join
  age_ratings cat on m.age_rating_id = cat.id
where
  user_id = 'eb90fb0e-9687-4423-bdb9-18566263a298';