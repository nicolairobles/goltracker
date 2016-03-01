class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.float :skill_potential_met
      t.references :goal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
