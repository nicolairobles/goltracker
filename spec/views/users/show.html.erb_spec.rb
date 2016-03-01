require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :fname => "Fname",
      :lname => "Lname",
      :password_digest => "Password Digest",
      :potential_met => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fname/)
    expect(rendered).to match(/Lname/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/1.5/)
  end
end
