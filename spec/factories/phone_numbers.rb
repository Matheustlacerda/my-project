FactoryBot.define do
  factory :phone_number do
    number { "+55 22 9984#{rand(0..9)}6578" }
    number_type { %w[home work other].sample }
    main { true }
    association :contact
  end
end
