require 'rails_helper'

RSpec.describe "skills/index", type: :view do
  before(:each) do
    assign(:skills, [
      Skill.create!(
        :skill_name => "Skill Name",
        :skill_potential_met => 1.5,
        :goal => nil
      ),
      Skill.create!(
        :skill_name => "Skill Name",
        :skill_potential_met => 1.5,
        :goal => nil
      )
    ])
  end

  it "renders a list of skills" do
    render
    assert_select "tr>td", :text => "Skill Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
