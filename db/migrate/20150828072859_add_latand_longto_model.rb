class AddLatandLongtoModel < ActiveRecord::Migration
  def change
    add_column :theatres, :latitude, :float
    add_column :theatres, :longitude, :float
  end
end
