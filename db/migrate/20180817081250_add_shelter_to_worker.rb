class AddShelterToWorker < ActiveRecord::Migration[5.2]
  def change
    add_reference :workers, :shelter, foreign_key: true
  end
end
