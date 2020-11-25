require 'user'

describe User do

  describe '.create' do 
    it 'creates a new user' do

      user = User.create(username: 'pablo', email: 'pablo@email.com', password: 'password123')

      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.query("SELECT * FROM users;")


      expect(user).to be_a User
      expect(user.id).to eq result.first['id']
      expect(user.email).to eq 'pablo@email.com'
    end
  
  end
end