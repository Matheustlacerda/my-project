FactoryBot.define do
  factory :contact do
    sequence(:name) { |n| "Jane#{n}" }
    bith_date { '10/10/2000' }
    association :user
  end
end
