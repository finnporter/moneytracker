require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'controllers/category_controller'
require_relative 'controllers/merchant_controller'
require_relative 'controllers/transaction_controller'
require_relative 'models/transaction'


get '/' do
  @transactions = Transaction.find_all
  erb :index
end