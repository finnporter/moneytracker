require_relative '../db/sql_runner.rb'
require_relative 'merchant'

class Transaction
  
  attr_reader :id
  attr_accessor :date, :amount, :expense, :merchant_id, :category_id, :expense

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @amount = options['amount'].to_f
    @expense = options['expense']
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (date, amount, expense, merchant_id, category_id) VALUES ($1, $2, $3, $4, $5) returning id"
    values = [@date, @amount, @expense, @merchant_id, @category_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE transactions SET (date, amount, expense, merchant_id, category_id) =  ($1, $2, $3, $4, $5) WHERE id = $5"
    values = [@date, @amount, @expense, @merchant_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1 "
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Transaction.new(result)
  end

  def find_merchant
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values)[0]
    return Merchant.new(result)
  end

  def find_category
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    result = SqlRunner.run(sql, values)[0]
    return Category.new(result)
  end

  # ***** CLASS METHODS ***** #

  def self.find_all
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    all_categories = map_helper(results)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  # ***** HELPER METHODS ***** #

  def self.map_helper results
    results.map { |result| Transaction.new(result) }
  end


end