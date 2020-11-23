require 'pg'
def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.query("SELECT * FROM makersbnb WHERE id = #{id};")
  result.first
end