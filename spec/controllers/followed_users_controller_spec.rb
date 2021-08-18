# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowedUsersController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user, username: 'current_user') }
  let!(:user2) { FactoryBot.create(:user, username: 'user2') }

  before do
    sign_in_as(user)
  end

  describe 'POST #create' do
    it 'creates new follow' do
      post :create, params: { id: user2.username }
      user2.reload

      expect(user2.followers_count).to eq(1)
      expect(response).to be_redirect
    end
  end

  describe 'DELETE #destroy' do
    before do
      post :create, params: { id: user2.username }
    end

    it 'deletes new follow' do
      delete :destroy, params: { id: user2.username }

      expect(user2.followers_count).to eq(0)
      expect(response).to be_redirect
    end
  end
end
