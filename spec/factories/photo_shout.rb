# frozen_string_literal: true

FactoryBot.define do
  factory :photo_shout do
    image { Rack::Test::UploadedFile.new(Rails.root + "spec/files/images/#{rand(1..10)}.png", 'image/png') }
  end
end
