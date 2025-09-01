-- Used in order page where user need to choose a seat.
-- Asumption : user already know the schedule (movie_id, city_id, time_id, cinemas_id, show_date)
-- Based on that schedul, search the sold seat
-- Logic
-- Search all transaction with specified schedule_id
select
  t.id,
  ts.seats_id,
  sc.seat_code
from
  transactions t
  join transactions_seats ts on ts.transactions_id = t.id
  join seat_codes sc on sc.id = ts.seats_id
where
  t.schedule_id = 4;