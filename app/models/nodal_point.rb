class NodalPoint < ActiveRecord::Base
  attr_accessible :camera, :lens, :focal_length, :offset

  belongs_to :lens
  belongs_to :camera
end
