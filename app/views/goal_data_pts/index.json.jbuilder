json.array!(@goal_data_pts) do |goal_data_pt|
  json.extract! goal_data_pt, :id, :data_pt_num, :perceived_performance, :perceived_progress, :actual_progress, :goal_id
  json.url goal_data_pt_url(goal_data_pt, format: :json)
end
