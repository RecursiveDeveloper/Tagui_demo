http://localhost:9000/sessions/new?return_to=%2F
type text as `username`
type password as `old_password`
click Log in
wait 6
type old_password as `old_password`
type password as `new_password`
type password_confirmation as `new_password`
click Update
