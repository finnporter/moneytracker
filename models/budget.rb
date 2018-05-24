require_relative '../db/sql_runner.rb'

class Budget
	
	attr_reader :id
	attr_accessor :current_budget

	def initialize options
		@id = options['id'].to_i if options['id']
		@current_budget = options['current_budget'].to_i
	end

	def save
    sql = "INSERT INTO budgets (current_budget) VALUES ($1) RETURNING id"
    values = [@current_budget]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE budgets SET current_budget = $1 WHERE id = $2"
    values = [@current_budget, @id]
    SqlRunner.run(sql, values)
  end

  # ***** CLASS METHODS ***** #

  def self.find_all
    sql = "SELECT * FROM budgets"
    results = SqlRunner.run(sql)
    all_categories = map_helper(results)
  end

  def self.delete_all
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  # ***** HELPER METHODS ***** #

  def self.map_helper results
    results.map { |result| Budget.new(result) }
  end
end