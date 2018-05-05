require 'pry-byebug'

require_relative '../models/category'

Category.delete_all

category1 = Category.new('name' => 'food')

category1.save

binding.pry
nil