require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @goal = goals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal" do
    assert_difference('Goal.count') do
      post :create, goal: { goal_description: @goal.goal_description, goal_potential_met: @goal.goal_potential_met, goal_title: @goal.goal_title, speed_recommendation: @goal.speed_recommendation, time_allotted: @goal.time_allotted, time_recommendation: @goal.time_recommendation, total_data_pts: @goal.total_data_pts, user_id: @goal.user_id }
    end

    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should show goal" do
    get :show, id: @goal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal
    assert_response :success
  end

  test "should update goal" do
    patch :update, id: @goal, goal: { goal_description: @goal.goal_description, goal_potential_met: @goal.goal_potential_met, goal_title: @goal.goal_title, speed_recommendation: @goal.speed_recommendation, time_allotted: @goal.time_allotted, time_recommendation: @goal.time_recommendation, total_data_pts: @goal.total_data_pts, user_id: @goal.user_id }
    assert_redirected_to goal_path(assigns(:goal))
  end

  test "should destroy goal" do
    assert_difference('Goal.count', -1) do
      delete :destroy, id: @goal
    end

    assert_redirected_to goals_path
  end
end
