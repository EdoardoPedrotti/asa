class CreateAdoptionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_requests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :animal, foreign_key: true

      t.timestamps
    end
  end
end
