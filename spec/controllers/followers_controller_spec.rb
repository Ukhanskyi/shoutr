# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }

  before do
    sign_in_as(user)
    user.follow(user2)
  end

  describe 'GET #index' do
    subject { get :index, params: { user_id: user2.username } }

    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end
  end
end
