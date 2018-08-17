class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :temp_name
      t.string :medical_condition
      t.string :image_url
      t.integer :status
      t.string :race
      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
