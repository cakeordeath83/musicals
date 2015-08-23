class CreateTheatres < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode

      t.timestamps null: false
    end
  end
end
