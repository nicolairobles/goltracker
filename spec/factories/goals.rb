FactoryGirl.define do
  factory :goal do
    goal_title {Faker::Hacker.verb + " " + Faker::Hacker.noun}
    time_allotted { rand(30..10080) }
    goal_description {Faker::Lorem.sentence}
    goal_potential_met {rand(1..100)}
    total_data_pts {rand(2..7)}
    time_recommendation {Faker::Lorem.sentence}
    speed_recommendation {Faker::Lorem.sentence}
    user_id {rand(1..10)}
  end
end
