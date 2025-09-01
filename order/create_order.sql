insert into transactions
-- Let's assume user book and ticket and paid directly
(user_id, payment_id, paid_at, total_payment, is_paid, phone_number, schedule_id) values (
  'eb90fb0e-9687-4423-bdb9-18566263a298',
  2,
  current_timestamp,
  20,
  true,
  '085155191433',
  3
);