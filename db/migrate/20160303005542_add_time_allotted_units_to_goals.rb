class AddTimeAllottedUnitsToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :time_allotted_units, :integer
  end
end
