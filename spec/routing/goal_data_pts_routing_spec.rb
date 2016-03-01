require "rails_helper"

RSpec.describe GoalDataPtsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/goal_data_pts").to route_to("goal_data_pts#index")
    end

    it "routes to #new" do
      expect(:get => "/goal_data_pts/new").to route_to("goal_data_pts#new")
    end

    it "routes to #show" do
      expect(:get => "/goal_data_pts/1").to route_to("goal_data_pts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/goal_data_pts/1/edit").to route_to("goal_data_pts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/goal_data_pts").to route_to("goal_data_pts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/goal_data_pts/1").to route_to("goal_data_pts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/goal_data_pts/1").to route_to("goal_data_pts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/goal_data_pts/1").to route_to("goal_data_pts#destroy", :id => "1")
    end

  end
end
