# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let!(:user) { FactoryBot.create(:user, username: 'current_user') }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before do
      sign_in_as(user)
      get :show, params: { id: user.username }
    end

    it 'opens GET #show' do
      expect(response).to be_successful
    end
  end

  describe 'Params new user' do
    it 'creates new user' do
      expect { post :create, params: { user: FactoryBot.attributes_for(:user) } }.to change(User, :count).by(1)
    end
  end
end
