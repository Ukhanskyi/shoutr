# frozen_string_literal: true

FactoryBot.define do
  factory :shout do
    association :user, factory: :user
    association :content, factory: :text_shout
    content_type { 'TextShout' }
  end
end
