require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :fname => "Fname",
        :lname => "Lname",
        :password_digest => "Password Digest",
        :potential_met => 1.5
      ),
      User.create!(
        :fname => "Fname",
        :lname => "Lname",
        :password_digest => "Password Digest",
        :potential_met => 1.5
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Fname".to_s, :count => 2
    assert_select "tr>td", :text => "Lname".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
