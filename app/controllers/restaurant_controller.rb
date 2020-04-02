class RestaurantController < Sinatra::Base
    set :views, "app/views/restaurants"

    get '/restaurants' do 
        @restaurants = Restaurant.all
        erb :index
    end

    get '/restaurants/new' do
        
        erb :new
    end

    post '/restaurants' do 
        name = params[:name]
        f_style = params[:f_style]
        if !name.empty?
            restaurant = Restaurant.find_or_create_by(name: name, f_style: f_style)
            params["food"].each do |food|
                food_name = food[:name]
                food_ingredients = food[:ingredients]
                    if !food_name.empty?
                        food = Food.find_or_create_by(name: food_name, ingredients: food_ingredients)
                        rf = RestaurantFood.create(food_id: food.id, restaurant_id: restaurant.id)
                    end
            end        
        redirect "/restaurants/#{restaurant.id}"
        else
            redirect "/restaurants/new"
        end 
    end

    
    get '/restaurants/:id' do
        @restaurant = Restaurant.find(params[:id])
        erb :show
    end
    
    get '/restaurants/:id/edit' do 
        @restaurant = Restaurant.find(params[:id])
        erb :edit
    end

    patch '/restaurants/:id' do 
        restaurant = Restaurant.find(params[:id])
        name = params[:name]
        f_style = params[:f_style]
        restaurant.update(name: name, f_style: f_style)
        redirect "/restaurants/#{restaurant.id}"
    end

    delete '/restaurants/:id' do
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        redirect "/restaurants"
    end


end