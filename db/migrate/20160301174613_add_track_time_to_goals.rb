class AddTrackTimeToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :track_time, :boolean
  end
end
