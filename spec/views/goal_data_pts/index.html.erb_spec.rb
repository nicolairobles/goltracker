require 'rails_helper'

RSpec.describe "goal_data_pts/index", type: :view do
  before(:each) do
    assign(:goal_data_pts, [
      GoalDataPt.create!(
        :data_pt_num => 1,
        :perceived_performance => 2,
        :perceived_progress => 1.5,
        :actual_progress => 1.5,
        :goal => nil
      ),
      GoalDataPt.create!(
        :data_pt_num => 1,
        :perceived_performance => 2,
        :perceived_progress => 1.5,
        :actual_progress => 1.5,
        :goal => nil
      )
    ])
  end

  it "renders a list of goal_data_pts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
