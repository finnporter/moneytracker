require_relative '../db/sql_runner.rb'

class Transaction
  
  attr_reader :id, :date, :amount, :merchant_id, :category_id, :expense

  def initialize(options)
    @id = options['id'].to_i options['id']
    @date = options['date']
    @merchant_id = options['merchant_id']
    @category_id = options['category_id']
    @expense = true
  end

  


end