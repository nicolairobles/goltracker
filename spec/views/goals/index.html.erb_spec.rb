require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        :goal_title => "Goal Title",
        :time_allotted => 1,
        :goal_description => "MyText",
        :goal_potential_met => 1.5,
        :total_data_pts => 2,
        :time_recommendation => "MyText",
        :speed_recommendation => "MyText",
        :user => nil
      ),
      Goal.create!(
        :goal_title => "Goal Title",
        :time_allotted => 1,
        :goal_description => "MyText",
        :goal_potential_met => 1.5,
        :total_data_pts => 2,
        :time_recommendation => "MyText",
        :speed_recommendation => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", :text => "Goal Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
