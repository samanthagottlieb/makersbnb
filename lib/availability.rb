require 'date'
class Availability
  attr_reader :id, :user_id, :start_date, :end_date, :date

  def initialize(id:, home_id:, date:)
    @id = id
    @home_id = home_id
    @date = date
    @availability = []
  end

  def self.create(home_id:, start_date:, end_date:)
    @availability = (Date.parse(start_date).to_date..Date.parse(end_date).to_date).map { |date| date.strftime('%Y-%m-%d') }

    result = @availability.each do |entry|
      DatabaseConnection.query("INSERT INTO availability (home_id, date) VALUES(#{home_id}, '#{entry}') RETURNING id, home_id, date;")
    end
    Availability.new(id: result[0]['id'], home_id: result[0]['home_id'], date: result[0]['date'])
  end

  def self.view(home_id:)
    result = DatabaseConnection.query("SELECT * FROM availability WHERE home_id = #{home_id};")

    list = result.to_a

    list.map { |entry| Date.parse(entry['date']).strftime('%d/%m/%Y') }
  end

  def self.remove(home_id:, date:)
    result = DatabaseConnection.query("SELECT id FROM availability WHERE home_id = #{home_id} AND date = '#{Date.parse(date).to_date.strftime('%Y-%m-%d')}';")
    DatabaseConnection.query("DELETE FROM availability WHERE id = #{result.first['id']};")
  end
end
