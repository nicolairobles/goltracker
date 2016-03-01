require 'rails_helper'

RSpec.describe "goal_data_pts/edit", type: :view do
  before(:each) do
    @goal_data_pt = assign(:goal_data_pt, GoalDataPt.create!(
      :data_pt_num => 1,
      :perceived_performance => 1,
      :perceived_progress => 1.5,
      :actual_progress => 1.5,
      :goal => nil
    ))
  end

  it "renders the edit goal_data_pt form" do
    render

    assert_select "form[action=?][method=?]", goal_data_pt_path(@goal_data_pt), "post" do

      assert_select "input#goal_data_pt_data_pt_num[name=?]", "goal_data_pt[data_pt_num]"

      assert_select "input#goal_data_pt_perceived_performance[name=?]", "goal_data_pt[perceived_performance]"

      assert_select "input#goal_data_pt_perceived_progress[name=?]", "goal_data_pt[perceived_progress]"

      assert_select "input#goal_data_pt_actual_progress[name=?]", "goal_data_pt[actual_progress]"

      assert_select "input#goal_data_pt_goal_id[name=?]", "goal_data_pt[goal_id]"
    end
  end
end
