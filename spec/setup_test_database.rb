require 'pg'
def clear_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec('TRUNCATE users CASCADE;')
  # Create guest account
#   connection.exec("INSERT INTO users (username,email,password) VALUES ('Guest','lucyjstringer+guest@gmail.com','guest123');")
end
