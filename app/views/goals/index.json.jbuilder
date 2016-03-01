json.array!(@goals) do |goal|
  json.extract! goal, :id, :goal_title, :time_allotted, :goal_description, :goal_potential_met, :total_data_pts, :time_recommendation, :speed_recommendation, :user_id
  json.url goal_url(goal, format: :json)
end
