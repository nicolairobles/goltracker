require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :fname => "MyString",
      :lname => "MyString",
      :password_digest => "MyString",
      :potential_met => 1.5
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_fname[name=?]", "user[fname]"

      assert_select "input#user_lname[name=?]", "user[lname]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_potential_met[name=?]", "user[potential_met]"
    end
  end
end
