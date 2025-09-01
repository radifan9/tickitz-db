-- This query used in the 'Account Settings' page where the user might want to change their details information
select
  id
from
  users
where
  email = 'slamet@gmail.com';

-- Get profile info
select
  first_name,
  last_name,
  phone_number
from
  user_profiles
where
  user_id = '3d060510-fc4c-4961-bb2a-a978ad35cd4f';