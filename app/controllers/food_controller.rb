class FoodController < Sinatra::Base

    set :views, "app/views/foods"
    set :method_override, true

    get '/foods' do
        @foods = Food.all
        erb :index
    end

    get '/foods/new' do
        @restaurants = Restaurant.all
        erb :new
    end

    post '/foods' do 

        name = params[:name]
        ingredients = params[:ingredients]
        food = Food.find_or_create_by(name: name, ingredients: ingredients)
        params[:restaurants].each do |r|
            rf = RestaurantFood.find_or_create_by(food_id: food.id, restaurant_id: r[:restaurant_id])
        
        end
        redirect "/foods/#{food.id}"
                
    end

    get '/foods/:id' do
        @food = Food.find_by(id: params[:id])
        erb :show
    end

    get '/foods/:id/edit' do 
        @food= Food.find(params[:id])
        erb :edit
    end

    patch '/foods/:id' do
        @food = Food.find(params[:id])
        @food.update(:name => params[:name], :ingredients => params[:ingredients])
        redirect "/foods/#{@food.id}"
    end

    delete '/foods/:id' do
        food = Food.find(params[:id])
        food.destroy
        redirect "/foods"
    end







    
end