# frozen_string_literal: true

FactoryBot.define do
  factory :shout do
    association :user, factory: :user
    association :content, { factory: :text_shout }
    content_type { 'TextShout' }

    trait :photo_shout do
      association :content, { factory: :photo_shout }
      content_type { 'PhotoShout' }
    end
  end
end
