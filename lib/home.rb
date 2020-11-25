class Home
  attr_reader :id, :user_id, :name, :description, :price

  def initialize(id:, user_id:, name:, description: 'Another lovely house', price:)
    @id = id
    @user_id = user_id
    @name = name
    @description = description
    @price = price
    @availability = [] 
  end

  def self.create(name:, description:, price:, username: 'Guest')
    result = DatabaseConnection.query("INSERT INTO homes (user_id, name, description, price) VALUES((SELECT id FROM users WHERE username='#{username}'),'#{name}','#{description}',#{price}) RETURNING id, user_id, name, description, price;")
    Home.new(id: result[0]['id'], user_id: result[0]['user_id'], name: (result[0]['name']), description: (result[0]['description']), price: result[0]['price'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM homes')
    result.map do |this|
      Home.new(
        name: this['name'],
        description: this['description'],
        price: this['price'],
        id: this['id'],
        user_id: this['user_id']
      )
   end
  end
end
