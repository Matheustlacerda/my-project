FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "John#{n}" }
    age { 30 }
    biograph { 'just an ordinary person' }
  end
end
