class AddLocationFieldsToRaces < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :latitude, :float
    add_column :races, :longitude, :float
    add_column :races, :address, :string
  end
end
