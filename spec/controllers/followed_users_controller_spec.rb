# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowedUsersController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user, username: 'current_user') }
  let!(:user2) { FactoryBot.create(:user, username: 'user2') }

  before do
    sign_in
  end

  # describe 'POST #create' do
  #   subject { post :create, params: { id: user2.username } }

  #   it 'creates new follow' do
  #     subject
  #     expect { FollowingRelationship }.to eq(1)
  #   end
  # end
end
