-- First check if email exist
select
  id,
  email
from
  users
where
  email = 'slamet@gmail.com'

-- Get the hashed password
select
  password
from 
  users
where
  id = '';

-- Get all info about that user
select
  u.id,
  u.role,
  p.first_name,
  p.profile_img
from
  users u
  left join user_profiles p on u.id = p.user_id
where
  u.email = 'slamet@gmail.com';