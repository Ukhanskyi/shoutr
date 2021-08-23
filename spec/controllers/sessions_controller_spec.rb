# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  describe 'POST #create' do
    context 'with correct params' do
      before do
        @user = FactoryBot.create(:user)

        post :create, params: {
          session: { email_or_username: @user.username, password: @user.password }
        }
      end

      it 'sets the user in the clearance session' do
        expect(request.env[:clearance].current_user).to eq @user
      end
    end
  end
end
