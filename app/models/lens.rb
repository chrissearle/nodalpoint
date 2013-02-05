class Lens < ActiveRecord::Base
  attr_accessible :brand, :name

  has_many :nodal_points

  belongs_to :user
end
