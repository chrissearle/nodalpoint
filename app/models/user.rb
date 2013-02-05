class User < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :authentications
  has_many :cameras
  has_many :lenses
  has_many :nodal_points

  def self.get_user(user_id)
    begin
      User.find(user_id)
    rescue ActiveRecord::RecordNotFound
      logger.warn "User #{user_id} requested but not found"
    end
  end
end
