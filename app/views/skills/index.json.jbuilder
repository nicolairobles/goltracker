json.array!(@skills) do |skill|
  json.extract! skill, :id, :skill_name, :skill_potential_met, :goal_id
  json.url skill_url(skill, format: :json)
end
