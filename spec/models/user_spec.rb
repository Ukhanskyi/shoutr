# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  email                :string           not null
#  encrypted_password   :string(128)      not null
#  confirmation_token   :string(128)
#  remember_token       :string(128)      not null
#  username             :string
#  followed_users_count :integer          default(0), not null
#  followers_count      :integer          default(0), not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user)  { FactoryBot.create(:user, username: 'some_username') }
  let!(:user2) { FactoryBot.create(:user, username: 'some_username2') }
  let!(:shout) { FactoryBot.create(:shout) }

  describe 'timeline_shouts' do
    let!(:shout1) { FactoryBot.create(:shout, user_id: user.id) }
    let!(:shout2) { FactoryBot.create(:shout, user_id: user2.id) }
    let(:result)  { [shout2, shout1] }

    it 'returns shouts created user and user2' do
      user.follow(user2)
      expect(user.timeline_shouts).to eq(result)
    end
  end

  describe 'factories' do
    it 'has valid factory' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  describe 'to_param' do
    it { expect(user.to_param).to eq('some_username') }
  end

  describe 'follow' do
    it 'Follows user to user 2' do
      user.follow(user2)

      expect(user2.followers_count).to eq(1)
    end
  end

  describe 'unfollow' do
    it 'Unfollows user to user 2' do
      user.unfollow(user2)

      expect(user2.followers_count).to eq(0)
    end
  end
end
