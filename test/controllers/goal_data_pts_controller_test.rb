require 'test_helper'

class GoalDataPtsControllerTest < ActionController::TestCase
  setup do
    @goal_data_pt = goal_data_pts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_data_pts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_data_pt" do
    assert_difference('GoalDataPt.count') do
      post :create, goal_data_pt: { actual_progress: @goal_data_pt.actual_progress, data_pt_num: @goal_data_pt.data_pt_num, goal_id: @goal_data_pt.goal_id, perceived_performance: @goal_data_pt.perceived_performance, perceived_progress: @goal_data_pt.perceived_progress }
    end

    assert_redirected_to goal_data_pt_path(assigns(:goal_data_pt))
  end

  test "should show goal_data_pt" do
    get :show, id: @goal_data_pt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_data_pt
    assert_response :success
  end

  test "should update goal_data_pt" do
    patch :update, id: @goal_data_pt, goal_data_pt: { actual_progress: @goal_data_pt.actual_progress, data_pt_num: @goal_data_pt.data_pt_num, goal_id: @goal_data_pt.goal_id, perceived_performance: @goal_data_pt.perceived_performance, perceived_progress: @goal_data_pt.perceived_progress }
    assert_redirected_to goal_data_pt_path(assigns(:goal_data_pt))
  end

  test "should destroy goal_data_pt" do
    assert_difference('GoalDataPt.count', -1) do
      delete :destroy, id: @goal_data_pt
    end

    assert_redirected_to goal_data_pts_path
  end
end
