require 'rails_helper'

RSpec.describe "skills/edit", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!(
      :skill_name => "MyString",
      :skill_potential_met => 1.5,
      :goal => nil
    ))
  end

  it "renders the edit skill form" do
    render

    assert_select "form[action=?][method=?]", skill_path(@skill), "post" do

      assert_select "input#skill_skill_name[name=?]", "skill[skill_name]"

      assert_select "input#skill_skill_potential_met[name=?]", "skill[skill_potential_met]"

      assert_select "input#skill_goal_id[name=?]", "skill[goal_id]"
    end
  end
end
