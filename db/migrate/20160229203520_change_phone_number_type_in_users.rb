class ChangePhoneNumberTypeInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :phone_number, :float
  end
 
  def self.down
    change_column :users, :phone_number, :integer
  end
end
