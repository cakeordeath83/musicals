class AddPictureToShow < ActiveRecord::Migration
  def up
    add_attachment :shows, :picture
  end
  
  def down
    remove_attachment :shows, :picture
  end
end
