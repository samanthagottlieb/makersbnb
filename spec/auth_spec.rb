describe '.authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(username: 'pablo', email: 'test@example.com', password: 'password123')
    authenticated_user = User.authenticate(username: 'pablo', password: 'password123')

    expect(authenticated_user.id).to eq user.id
  end
end
