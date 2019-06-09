# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "ayumu" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
