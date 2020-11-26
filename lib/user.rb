require 'pg'

class User

  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end
