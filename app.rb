require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative 'controllers/category_controller'
require_relative 'controllers/merchant_controller'
require_relative 'controllers/transaction_controller'
require_relative 'models/transaction'


get '/' do
  @transactions = Transaction.find_all
  # FIXME transaction stores transaction.amount as MONEY(with decimals) in the db but when pulling it back from the db, it come back as Integeger? Problem has changed to displaying decimals but only 0.0 instead of the actual value. WTF?
  erb :index
end