-- Logic nya gini:
-- Di transaction join dengan schedule
-- Lalu kelompokkan berdasarkan movie_id
-- Lalu urutkan berdasarkan jumlah transaksi (jumlah id di transactions)
-- Ini masih belum sempurna, yang sempurna adalah kita urutkan berdasarkan jumlah sold seat

select
  s.movie_id,
  count(t.id) as total_transactions
from
  transactions t
  join schedules s on t.schedule_id = s.id
where
  s.show_date >= current_date
group by
  movie_id
order by
  total_transactions desc;