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
end