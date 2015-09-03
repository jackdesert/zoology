class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.integer :zoo_id

      t.timestamps null: false
    end
    add_index :animals, :zoo_id
  end
end
