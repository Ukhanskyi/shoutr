# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowersController, type: :controller do
  render_views

  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  # let!(:shout) { FactoryBot.create(:shout, user: user) }

  before do
    sign_in
    user.follow(user2)
  end

  # describe 'GET #index' do
  #   subject { get :index, params: { user_id: user2.id } }

  #   it 'returns http success' do
  #     subject
  #     expect(response).to have_http_status(:success)
  #   end

  #   # it { is_expected.to render_template(:show) }
  # end
end
