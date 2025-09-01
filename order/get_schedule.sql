-- This is a query for page detail.
-- Here user will search available cinema (ebv.id, hiflix, dll) based on 
-- `show_date` = "Choose Date"
-- `time_id` = "Choose Time"
-- `city` = "Choose Location" 

-- Based on that 3 criteria and opened detail movie page, there will a cinema.

select
  s.cinema_id,
  c.name,
  c.img
from
  schedules s
  join cinemas c on s.cinema_id = c.id
where
  movie_id = 1
  AND show_date = '2025-09-15'
  AND show_time_id = 4
  AND city_id = 4;