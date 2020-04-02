class CreateRestaurantFoodsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_foods do |r|
      r.integer :restaurant_id
      r.integer :food_id 
      r.timestamps
    end
  end
end
