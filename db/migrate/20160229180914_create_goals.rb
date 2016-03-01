class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal_title
      t.integer :time_allotted
      t.text :goal_description
      t.float :goal_potential_met
      t.integer :total_data_pts
      t.text :time_recommendation
      t.text :speed_recommendation
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
