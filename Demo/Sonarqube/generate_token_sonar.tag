`sonar_url`
type text as `username`
type password as `new_password`
click Log in
wait 5
click userAccountMenuDropdown-trigger
click My Account
click Security
type token-name as `sonar_token_name`
click react-select__value-container css-2567nx
click Global Analysis Token
click Generate
click Copy
contents = clipboard()
dump `contents` to `sonar_token_filename`
