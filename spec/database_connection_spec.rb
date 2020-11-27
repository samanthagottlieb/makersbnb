require 'database_connection'
describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      DatabaseConnection.setup('makersbnb_test')
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec).with('SELECT * FROM homes;')
      DatabaseConnection.query('SELECT * FROM homes;')
    end
  end
end
