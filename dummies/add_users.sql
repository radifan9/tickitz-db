INSERT INTO users (email, password, role)
VALUES
  ('radif@gmail.com', '12345', 'admin'),
  ('slamet@gmail.com', '12345', 'user'),
  ('opet@gmail.com', 'opet123', 'user')
RETURNING id, email, role;
