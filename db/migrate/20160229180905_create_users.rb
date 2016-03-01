class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :password_digest
      t.float :potential_met

      t.timestamps null: false
    end
  end
end
