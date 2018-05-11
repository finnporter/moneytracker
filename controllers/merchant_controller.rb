require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/merchant'


# INDEX
get "/merchants" do
  @merchants = Merchant.find_all
  erb :"merchant/index"
end

# NEW
get "/merchants/new" do
  erb :"merchant/new"
end

post "/merchants" do
  Merchant.new(params).save
  redirect to "/merchants"
end

# EDIT
get "/merchants/:id/edit" do
  @merchant = Merchant.find(params['id'])
  erb :"merchant/edit"
end

post "/merchants/:id" do
  Merchant.new(params).update
  redirect to "/merchants"
end

# DESTROY
post "/merchants/:id/delete" do
  Merchant.find(params['id']).delete
  redirect to "/merchants"
end