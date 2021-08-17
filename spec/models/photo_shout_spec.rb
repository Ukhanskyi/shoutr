# frozen_string_literal: true

# == Schema Information
#
# Table name: photo_shouts
#
#  id                 :bigint           not null, primary key
#  image_file_name    :string           not null
#  image_content_type :string           not null
#  image_file_size    :bigint           not null
#  image_updated_at   :datetime         not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe PhotoShout, type: :model do
  let!(:photo_shout) { FactoryBot.create(:photo_shout) }

  describe 'factories' do
    it 'has valid factory' do
      expect(FactoryBot.create(:photo_shout)).to be_valid
    end
  end
end
