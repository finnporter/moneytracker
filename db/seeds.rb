require 'pry-byebug'

require_relative '../models/category'
require_relative '../models/merchant'

Category.delete_all
Merchant.delete_all 

category1 = Category.new('name' => 'food')
category1.save

merchant1 = Merchant.new('name' => 'Sainsbury')
merchant1.save

binding.pry
nil