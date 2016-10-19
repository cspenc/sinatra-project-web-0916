class RestaurantController < ApplicationController

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :"/restaurants/index.html"
  end

  get '/restaurants/new' do
    erb :"/restaurants/new.html"
  end

  post '/restaurants/search' do
    RestaurantAPI.search(params[:city])
    redirect "/restaurants"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
    erb :"/restaurants/show.html"
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  post '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    UserRestaurant.create(user_id: params[:user][:id], restaurant_id: @restaurant.id)
    redirect "/restaurants/#{@restaurant.id}"
  end

  post '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :"/restaurants/edit.html"
  end

  patch '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect "/restaurants"
  end

end
