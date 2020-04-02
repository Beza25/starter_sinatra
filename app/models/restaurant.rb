class Restaurant < ActiveRecord::Base
    has_many :restaurant_foods
    has_many :foods, :through => :restaurant_foods

end