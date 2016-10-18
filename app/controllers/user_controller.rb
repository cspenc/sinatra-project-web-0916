class UserController < ApplicationController

  get '/users' do
    @users = User.all
    erb :"/users/index.html"
  end

  get '/users/new' do
    erb :"/users/new.html"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  post '/users' do
    @user = User.create(params[:user])
    redirect "/users/#{@user.id}"
  end

end
