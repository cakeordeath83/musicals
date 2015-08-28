class ChangeAddress1ToAddress < ActiveRecord::Migration
   def self.up
     rename_column :theatres, :address1, :address
  end

  def self.down
    rename_column :theatres, :address, :address1
  end
end
