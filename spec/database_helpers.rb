require 'pg'
def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM makersbnb WHERE id = #{id};")
  result.first
end

def sign_up
  visit('/signup')
  fill_in(:username, with: 'Pablito')
  fill_in(:email, with: 'pablito@thelion.com')
  fill_in(:password, with: 'roar123')
  click_button('Sign up')
end

def add_home
  click_link('Add home')
  fill_in('name', with: 'Test home')
  fill_in('price', with: '60')
  fill_in('description', with: 'A nice home')
  fill_in('start_date', with: '01/02/2021')
  fill_in('end_date', with: '04/02/2021')
  click_button('Submit') 
end
