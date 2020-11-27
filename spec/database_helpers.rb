require 'pg'

def sign_up
  visit('/signup')
  fill_in(:username, with: 'Pablito')
  fill_in(:email, with: 'pablito@thelion.com')
  fill_in(:password, with: 'roar123')
  click_button('Sign up')
end

def log_in
  click_button('Log in')
  fill_in(:username, with: 'Pablito')
  fill_in(:password, with: 'roar123')
  click_button('Log in')
end
