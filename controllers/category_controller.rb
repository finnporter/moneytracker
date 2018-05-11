require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/category'

get "/categories" do
  @categories = Category.find_all
  erb :"category/index"
end

get "/categories/new" do
  erb :"category/new"
end