require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/transaction'


# INDEX
# is on home page (../app.rb)

# NEW
get "/transactions/new" do
  @merchants = Merchant.find_all
  @categories = Category.find_all
  erb :"transaction/new"
end

post "/transactions" do
  Transaction.new(params).save
  redirect to "/"
end