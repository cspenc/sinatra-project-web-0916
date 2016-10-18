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

  post '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"/users/edit.html"
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    @user.delete
    redirect "/users"
  end

end
