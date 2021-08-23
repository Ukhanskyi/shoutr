# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserHelper, type: :helper do
  let!(:user)  { FactoryBot.create(:user, username: 'current_user') }
  let!(:user2) { FactoryBot.create(:user, username: 'some_username') }

  describe '#follow_button' do
    before do
      sign_in_as(user)
    end

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

  describe 'user_signed_in?' do
    context 'with sign ined user' do
      before do
        sign_in_as(user)
      end

      it { expect(helper.user_signed_in?).to be_truthy }
    end

    context 'without sign ined user' do
      let!(:guest) { Guest.new }

      before do
        sign_in_as(guest)
      end

      it { expect(helper.user_signed_in?).to be_falsy }
    end
  end
end
