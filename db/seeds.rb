
f1 = Food.create(name: "pizza", ingredients: "chiken, olive, mushroom")
f2 = Food.create(name: "Sushi", ingredients: "Salmon, Hot sauce")
f3 = Food.create(name: "Soup", ingredients: "broth, carrots, meat")
f5 = Food.create(name: "Chicken Alfredo", ingredients: "spring ravioli, 4 cheese, alfredo sauce")
f4 = Food.create(name: "burger", ingredients: "Bread, burger patty, veggies")


r3 = Restaurant.create(name: "Papa Johns", f_style: "Italian")
r2 = Restaurant.create(name: "Pho-Eatery", f_style: "Japanese")
r1 = Restaurant.create(name: "East-Side Marios", f_style: "Italian")
r4 = Restaurant.create(name: "MamaIguna", f_style: "Mexican")


rf1 = RestaurantFood.create(food_id: f1.id, restaurant_id: r3.id)
rf2 = RestaurantFood.create(food_id: f4.id, restaurant_id: r1.id)
rf3 = RestaurantFood.create(restaurant_id: r1.id, food_id: f1.id)
rf4 = RestaurantFood.create(food_id: f2.id, restaurant_id: r2.id) 
rf6 = RestaurantFood.create(food_id: f5.id, restaurant_id: r1.id)
rf5 = RestaurantFood.create(restaurant_id: r1.id, food_id: f5.id)
rf6 = RestaurantFood.create(restaurant_id: r4.id, food_id: f5.id)