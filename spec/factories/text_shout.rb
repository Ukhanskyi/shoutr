# frozen_string_literal: true

FactoryBot.define do
  factory :text_shout do
    body { Faker::Internet.username }
  end
end
