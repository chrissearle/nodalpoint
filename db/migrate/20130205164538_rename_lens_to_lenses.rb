class RenameLensToLenses < ActiveRecord::Migration
  def up
    rename_table :lens, :lenses
  end

  def down
    rename_table :lenses, :lens
  end
end
