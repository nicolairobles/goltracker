require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      :goal_title => "MyString",
      :time_allotted => 1,
      :goal_description => "MyText",
      :goal_potential_met => 1.5,
      :total_data_pts => 1,
      :time_recommendation => "MyText",
      :speed_recommendation => "MyText",
      :user => nil
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input#goal_goal_title[name=?]", "goal[goal_title]"

      assert_select "input#goal_time_allotted[name=?]", "goal[time_allotted]"

      assert_select "textarea#goal_goal_description[name=?]", "goal[goal_description]"

      assert_select "input#goal_goal_potential_met[name=?]", "goal[goal_potential_met]"

      assert_select "input#goal_total_data_pts[name=?]", "goal[total_data_pts]"

      assert_select "textarea#goal_time_recommendation[name=?]", "goal[time_recommendation]"

      assert_select "textarea#goal_speed_recommendation[name=?]", "goal[speed_recommendation]"

      assert_select "input#goal_user_id[name=?]", "goal[user_id]"
    end
  end
end
