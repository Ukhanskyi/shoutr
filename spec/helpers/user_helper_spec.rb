# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserHelper, type: :helper do
  let!(:user)  { FactoryBot.create(:user, username: 'current_user') }
  let!(:user2) { FactoryBot.create(:user, username: 'some_username') }

  before do
    sign_in_as(user)
  end

  describe '#follow_button' do
    context 'without followed user' do
      it 'returns Follow' do
        expect(helper.follow_button(user2)).to include 'Follow'
      end
    end

    context 'with followed user' do
      before do
        user.follow(user2)
      end

      it 'returns Unfollow' do
        expect(helper.follow_button(user2)).to include('Unfollow')
      end
    end
  end
end
