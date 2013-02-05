class Lens < ActiveRecord::Base
  attr_accessible :brand, :name, :minimum_focal_length, :maximum_focal_length

  has_many :nodal_points

  belongs_to :user

  scope :ordered, :order => 'name ASC, brand ASC'

  before_validation :set_focal_range_from_name

  validates_presence_of :brand, :name, :minimum_focal_length, :maximum_focal_length
  validates_numericality_of :minimum_focal_length, :maximum_focal_length

  def deletable?
    nodal_points.size() == 0
  end

  def focal_range
    [self.minimum_focal_length, self.maximum_focal_length].uniq.sort.map { |fl| "#{fl}mm" }.join " - "
  end

  private

  def set_focal_range_from_name
    unless has_focal_range?
      parts = self.name.split("-").map { |i| i.to_i }

      self.minimum_focal_length = parts.min
      self.maximum_focal_length = parts.max
    else
      if has_minimum_focal_range?
        self.maximum_focal_length = self.minimum_focal_length
      end
    end
  end

  def has_focal_range?
    has_minimum_focal_length? && has_maximum_focal_length?
  end

  def has_minimum_focal_length?
    !self.minimum_focal_length.blank? && self.minimum_focal_length > 0
  end

  def has_maximum_focal_length?
    !self.maximum_focal_length.blank? && self.maximum_focal_length > 0
  end

end
