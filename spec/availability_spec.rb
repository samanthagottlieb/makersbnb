require 'availability'

describe Availability do
  it 'stores availability for a home' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users (username,email,password) VALUES ('Guest','lucyjstringer+guest@gmail.com','guest123');")
    home = Home.create(name: 'Test home', description: 'Another lovely home', price: 100)
    availability = Availability.create(home_id: home.id, start_date: '01/12/2020', end_date: '09/12/2020')

    result = connection.exec("SELECT * FROM availability")

    expect(result.first['date']).to eq '2020-12-01'

  end

  it 'returns arr of availabe dates' do 
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users (username,email,password) VALUES ('Guest','lucyjstringer+guest@gmail.com','guest123');")
    home = Home.create(name: 'Test home', description: 'Another lovely home', price: 100)
    availability = Availability.create(home_id: home.id, start_date: '01/12/2020', end_date: '09/12/2020')
    
    result = Availability.view(home_id: home.id)
    expect(result).to be_a Array 
    expect(result[0]).to eq '01/12/2020'
    expect(result[1]).to eq '02/12/2020'
    expect(result[-1]).to eq '09/12/2020'
  
  end
end
