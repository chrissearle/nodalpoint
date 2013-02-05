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

  validates_presence_of :offset, :focal_length, :camera, :lens
  validates_numericality_of :offset, :focal_length
  validate :camera_owned_by_me
  validate :lens_owned_by_me

  def self.ordered
    NodalPoint.order('cameras.name ASC, lenses.name ASC, focal_length ASC').joins(:camera).joins(:lens).preloaded
  end

  private

  def lens_owned_by_me
    if self.lens
      unless self.user == self.lens.user
        errors.add(:lens, "You can only choose from your own lenses")
      end
    end
  end

  def camera_owned_by_me
    if self.camera
      unless self.user == self.camera.user
        errors.add(:camera, "You can only choose from your own cameras")
      end
    end
  end

end
