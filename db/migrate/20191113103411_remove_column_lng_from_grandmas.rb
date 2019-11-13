class RemoveColumnLngFromGrandmas < ActiveRecord::Migration[5.2]
  def change
    remove_column :grandmas, :lng
    remove_column :grandmas, :lat
    add_column :grandmas, :latitude, :float
    add_column :grandmas, :longitude, :float
  end
end
