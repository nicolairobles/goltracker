require 'rails_helper'

RSpec.describe "GoalDataPts", type: :request do
  describe "GET /goal_data_pts" do
    it "works! (now write some real specs)" do
      get goal_data_pts_path
      expect(response).to have_http_status(200)
    end
  end
end
