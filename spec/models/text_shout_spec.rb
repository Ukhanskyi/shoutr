# frozen_string_literal: true

# == Schema Information
#
# Table name: text_shouts
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe TextShout, type: :model do
  describe 'factories' do
    it 'has valid factory' do
      expect(FactoryBot.create(:text_shout)).to be_valid
    end
  end
end
