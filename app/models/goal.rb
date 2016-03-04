class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :goal_data_pts
end
