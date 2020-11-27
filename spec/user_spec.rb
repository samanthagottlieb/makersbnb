require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'pablo', email: 'pablo@email.com', password: 'password123')

      connection = PG.connect(dbname: 'makersbnb_test')
      result = connection.query('SELECT * FROM users;')

      expect(user).to be_a User
      expect(user.id).to eq result.first['id']
      expect(user.email).to eq 'pablo@email.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(username: 'pablo', email: 'pablo@email.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns nil if there is no ID given' do
      User.create(username: 'pablo', email: 'pablo@email.com', password: 'password123')

      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(username: 'pablo', email: 'test@example.com', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'pablo', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(username: 'pablo', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect username' do
      User.create(username: 'pablo', email: 'test@example.com', password: 'password123')

      expect(User.authenticate(username: 'not pablo', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      User.create(username: 'pablo', email: 'test@example.com', password: 'password123')

      expect(User.authenticate(username: 'pablo', password: 'not_password123')).to be_nil
    end
  end

  feature 'authentication' do
    scenario 'a user can sign out' do
      User.create(username: 'test', email: 'test1', password: 'password123')
      visit '/sessions/new'
      fill_in(:username, with: 'test')
      fill_in(:password, with: 'password123')
      click_button('Log in')

      click_button('Log out')

      expect(page).to have_content 'Homes to rent'
      expect(page).to have_content 'You have signed out.'
    end
  end
end
