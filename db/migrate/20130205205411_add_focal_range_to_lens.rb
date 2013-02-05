class AddFocalRangeToLens < ActiveRecord::Migration
  def change
    add_column :lenses, :minimum_focal_length, :integer, :null => false, :default => 0
    add_column :lenses, :maximum_focal_length, :integer, :null => false, :default => 0
    
    Lens.all.each do |lens|
      parts = lens.name.split("-").map{ |i| i.to_i }
      
      lens.minimum_focal_length = parts.min
      lens.maximum_focal_length = parts.max
      lens.save
    end
  end
end
