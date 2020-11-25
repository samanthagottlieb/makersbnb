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
