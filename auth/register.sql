-- Check is email already registered?
-- If the email is registered, it will return 1
SELECT
  1 as is_registered
FROM
  users
WHERE
  email = 'radif@gmail.com';


-- If email not registered, then we can register it
-- user role is 'user' (normal user) by default 
insert into
  users (email, password)
values
  ('radif@gmail.com', '12345');