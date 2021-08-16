# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let!(:user)   { FactoryBot.create(:user) }
  let!(:shout)  { FactoryBot.create(:shout, user: user) }
  let!(:shout2) { FactoryBot.create(:shout, user: user) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
