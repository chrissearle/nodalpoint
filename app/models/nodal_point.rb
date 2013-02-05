class NodalPoint < ActiveRecord::Base
  attr_accessible :focal_length, :offset, :camera_id, :lens_id

  belongs_to :lens
  belongs_to :camera

  belongs_to :user

  delegate :name,  :to => :camera, :prefix => true, :allow_nil => true
  delegate :brand, :to => :camera, :prefix => true, :allow_nil => true
  delegate :name,  :to => :lens,   :prefix => true, :allow_nil => true
  delegate :brand, :to => :lens,   :prefix => true, :allow_nil => true

  scope :preloaded, :include => [:camera, :lens]
  
  def self.ordered
    NodalPoint.order('cameras.name ASC, lenses.name ASC, focal_length ASC').joins(:camera).joins(:lens).preloaded
  end
end
