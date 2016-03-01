FactoryGirl.define do
  factory :skill do
    skill_name {Faker::Hacker.ingverb}
    skill_potential_met {rand(1..100)}
    goal_id {rand(1..100)}
  end
end
