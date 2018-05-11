require_relative '../db/sql_runner.rb'

class Merchant
  
  attr_reader :id
  attr_accessor :name


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO merchants (name) VALUES ($1) returning id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # ***** CLASS METHODS ***** #

  def self.find_all
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    all_categories = map_helper(results)
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  # ***** HELPER METHODS ***** #

  def self.map_helper results
    results.map { |result| Merchan.new(result) }
  end

end