FactoryGirl.define do
  factory :goal_data_pt do
    data_pt_num {rand(1..10)}
    perceived_performance {rand(1..100)}
    perceived_progress {rand(1..100)}
    actual_progress {rand(1..100)}
    goal_id {rand(1..100)}
  end
end
