# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guest do
  let!(:shout) { FactoryBot.create(:shout) }

  describe 'email' do
    it { expect(described_class.new.email).to eq('') }
  end

  describe 'liked?' do
    it { expect(described_class.new.liked?(shout)).to eq(false) }
  end
end
