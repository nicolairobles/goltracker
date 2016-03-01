FactoryGirl.define do
  factory :user do
    fname {Faker::Name.first_name}
    lname {Faker::Name.last_name}
    password_digest "12345"
    potential_met {Faker::Number.number(2)}
    phone_number {Faker::Number.number(10)}
  end
end
