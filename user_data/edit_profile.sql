UPDATE
  user_profiles p
SET
  first_name = 'christian',
  last_name = 'ce',
  profile_img = '/ce.png',
  phone_number = '08911'
FROM
  users u
WHERE
  p.user_id = u.id
  AND u.email = 'slamet@gmail.com';