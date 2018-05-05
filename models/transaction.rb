require_relative '../db/sql_runner.rb'

class Transaction
  
  attr_reader :id
  attr_accessor :date, :amount, :merchant_id, :category_id, :expense

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @date = options['date']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @expense = true
  end

  def save
    sql = "INSERT INTO transactions (date, amount, merchant_id, category_id) VALUES ($1, $2, $3, $4) returning id"
    values = [@date, @amount, @merchant_id, @category_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update
    sql = "UPDATE transactions SET (date, amount, merchant_id, category_id) =  ($1, $2, $3, $4) WHERE id = $5"
    values = [@date, @amount, @merchant_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end


end