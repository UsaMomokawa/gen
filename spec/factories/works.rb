FactoryBot.define do
  factory :work do
    title { "テストの原稿" }
    user { FactoryBot.create :user }
    deadline { Date.current }

    trait(:with_pages) do
      after(:create) do |work, evaluator|
        create_list(:page, 4, work: work)
      end
    end
  end
end
