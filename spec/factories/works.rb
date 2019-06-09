# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    title { "テストの原稿" }
    user { create :user }
    deadline { Date.current }

    trait(:with_pages) do
      after(:create) do |work, evaluator|
        create_list(:page, 4, work: work)
      end
    end

    trait(:with_stages) do
      after(:create) do |work, evaluator|
        pages = create_list(:page, 4, work: work)
        stage = create(:stage, name: "線画", work: work)
        pages.each do |page|
          create(:progress, work: work, stage: stage, page: page)
        end
      end
    end
  end
end
