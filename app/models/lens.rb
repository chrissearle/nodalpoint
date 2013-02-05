class Lens < ActiveRecord::Base
  attr_accessible :brand, :name

  has_many :nodal_points

  belongs_to :user

  scope :ordered, :order => 'name ASC, brand ASC'

  def deletable?
    nodal_points.size() == 0
  end
end
