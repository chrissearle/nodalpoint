class Camera < ActiveRecord::Base
  attr_accessible :brand, :name

  has_many :nodal_points

  belongs_to :user

  scope :ordered, :order => 'name ASC, brand ASC'

  validates_presence_of :name, :brand

  def deletable?
    nodal_points.size() == 0
  end
end
