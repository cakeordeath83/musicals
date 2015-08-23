class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.date :date
      t.references :show, index: true, foreign_key: true
      t.references :theatre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
