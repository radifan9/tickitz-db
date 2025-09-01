-- This query will be used in admin dashboard movie
-- When admin clicked delete button on the dashboard movie

-- First we delete the schedules

delete from
  movies
where
  id = '7';