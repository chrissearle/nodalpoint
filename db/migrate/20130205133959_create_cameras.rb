class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name, :null => false
      t.string :brand, :null => false

      t.timestamps
    end
  end
end
