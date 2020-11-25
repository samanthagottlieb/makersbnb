require 'availability'

describe Availability do
  it 'creates availability for a home' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users (username,email,password) VALUES ('Guest','lucyjstringer+guest@gmail.com','guest123');")
    home = Home.create(name: 'Test home', description: 'Another lovely home', price: 100)
    availability = Availability.create(home_id: home.id, start_date: '01/12/2020', end_date: '09/12/2020')

    result = connection.exec("SELECT * FROM availability")

    expect(result.first['date']).to eq '2020-12-01'

  end
end
