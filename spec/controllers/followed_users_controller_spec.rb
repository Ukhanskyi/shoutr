# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowedUsersController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user, username: 'current_user') }
  let!(:user2) { FactoryBot.create(:user, username: 'user2') }

  describe 'POST #create' do
    before do
      sign_in_as(user)
      post :create, params: { id: user2.username }
    end

    it 'creates new follow' do
      expect(User.last.followers_count).to eq(1)
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in_as(user)
      post :create, params: { id: user2.username }
    end

    it 'deletes new follow' do
      delete :destroy, params: { id: user2.username }

      expect(User.last.followers_count).to eq(0)
      expect(response).to be_redirect
    end
  end
end
