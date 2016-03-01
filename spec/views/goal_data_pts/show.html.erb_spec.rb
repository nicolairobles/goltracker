require 'rails_helper'

RSpec.describe "goal_data_pts/show", type: :view do
  before(:each) do
    @goal_data_pt = assign(:goal_data_pt, GoalDataPt.create!(
      :data_pt_num => 1,
      :perceived_performance => 2,
      :perceived_progress => 1.5,
      :actual_progress => 1.5,
      :goal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
  end
end
