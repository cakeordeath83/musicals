class AddPictureToTheatre < ActiveRecord::Migration
  def up
    add_attachment :theatres, :picture
  end
  
  def down
    remove_attachment :theatres, :picture
  end
end
