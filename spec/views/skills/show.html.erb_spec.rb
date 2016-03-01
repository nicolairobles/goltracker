require 'rails_helper'

RSpec.describe "skills/show", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!(
      :skill_name => "Skill Name",
      :skill_potential_met => 1.5,
      :goal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Skill Name/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
