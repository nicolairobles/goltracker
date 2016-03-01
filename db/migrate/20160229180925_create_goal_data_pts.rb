class CreateGoalDataPts < ActiveRecord::Migration
  def change
    create_table :goal_data_pts do |t|
      t.integer :data_pt_num
      t.integer :perceived_performance
      t.float :perceived_progress
      t.float :actual_progress
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
