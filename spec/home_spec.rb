describe Home do
  it 'creates a new home' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users (username,email,password) VALUES ('Guest','lucyjstringer+guest@gmail.com','guest123');")
    home = Home.create(name: 'Test home', description: 'Another lovely home', price: 100)

    expect(home).to be_a Home
    # expect(home.home_id).to eq 1
    expect(home.name).to eq 'Test home'
    expect(home.description).to eq 'Another lovely home'
    expect(home.price).to eq '100.00'
  end
end
