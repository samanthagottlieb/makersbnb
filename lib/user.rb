require 'pg'

class User

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

end
