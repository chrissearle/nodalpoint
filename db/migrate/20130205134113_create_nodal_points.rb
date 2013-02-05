class CreateNodalPoints < ActiveRecord::Migration
  def change
    create_table :nodal_points do |t|
      t.integer :camera_id
      t.integer :lens_id
      t.integer :focal_length, :null => false
      t.float :offset, :null => false

      t.timestamps
    end

    add_index :nodal_points, :camera_id
    add_index :nodal_points, :lens_id
  end
end
