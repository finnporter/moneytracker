require 'pry-byebug'

require_relative '../models/category'
require_relative '../models/merchant'
require_relative '../models/transaction'

Category.delete_all
Merchant.delete_all
Transaction.delete_all


category1 = Category.new('name' => 'food')
category1.save

merchant1 = Merchant.new('name' => 'Sainsbury')
merchant1.save

transaction1 = Transaction.new('date' => '2018-05-05', 'amount' => '20', 'merchant_id' => merchant1.id, 'category_id' => category1.id)
transaction1.save

binding.pry
nil