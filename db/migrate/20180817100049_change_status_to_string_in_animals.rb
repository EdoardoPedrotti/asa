class ChangeStatusToStringInAnimals < ActiveRecord::Migration[5.2]
  def up
    change_column :animals, :status, :string
  end

  def down
    change_column :animals, :status, :integer
  end
end
