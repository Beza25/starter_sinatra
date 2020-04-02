class CreateRestaurantsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |r|
      r.text :name
      r.text :f_style
      r.timestamps
    end
  end
end
