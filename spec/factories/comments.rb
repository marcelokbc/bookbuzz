FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    book { nil }
  end
end
