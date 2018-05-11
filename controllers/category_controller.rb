require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category'


# INDEX
get "/categories" do
  @categories = Category.find_all
  erb :"category/index"
end

# NEW
get "/categories/new" do
  erb :"category/new"
end

post "/categories" do
  Category.new(params).save
  redirect to "/categories"
end

# EDIT
get "/categories/:id/edit" do
  @category = Category.find_all[0]
  erb :"category/edit"
end

post "/categories/:id" do
  Category.new(params).update
  redirect to "/categories"
end