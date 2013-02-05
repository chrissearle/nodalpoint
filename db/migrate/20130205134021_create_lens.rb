class CreateLens < ActiveRecord::Migration
  def change
    create_table :lens do |t|
      t.string :name, :null => false
      t.string :brand, :null => false

      t.timestamps
    end
  end
end
