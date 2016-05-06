class User < ActiveRecord::Base
	has_secure_password
	has_many :goals
  has_many :skills, :through => :goals
  has_many :goal_data_pts, :through => :goals
  validates :phone_number, format: { with: /\d{3}\d{3}\d{4}/, message: "invalid number" }
  validates_uniqueness_of :phone_number
	# attr_accessible :phone_number, :password_digest
end
