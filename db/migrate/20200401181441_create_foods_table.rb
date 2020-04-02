class CreateFoodsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.text :name
      t.text :ingredients
      t.timestamps
    end
  end
end
