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

# EDIT
get "/transactions/:id/edit" do
  @transaction = Transaction.find(params['id'])
  @merchants = Merchant.find_all
  @categories = Category.find_all
  erb :"transaction/edit"
end

post "/transactions/:id" do
  Transaction.new(params).update
  redirect to "/"
end

# DESTROY
post "/transactions/:id/delete" do
  Transaction.find(params['id']).delete
  redirect to "/"
end