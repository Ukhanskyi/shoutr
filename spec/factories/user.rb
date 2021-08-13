# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { SecureRandom.hex(8) }
    email { Faker::Internet.email }
  end
end
