json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :password_digest, :potential_met
  json.url user_url(user, format: :json)
end
