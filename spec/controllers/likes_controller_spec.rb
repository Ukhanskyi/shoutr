# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user) }
  let!(:shout) { FactoryBot.create(:shout) }

  before do
    sign_in
  end

  describe 'POST #create' do
    subject { post :create, params: { id: shout.id } }

    it 'creates new like' do
      expect { subject }.to change(Like, :count).by(+1)
    end

    it { is_expected.to be_redirect }
  end

  describe 'DELETE #destroy' do
    let!(:fake_shout) { FactoryBot.create(:shout) }

    before do
      post :create, params: { id: shout.id }
    end

    subject { delete :destroy, params: { id: shout.id } }

    it 'deletes like' do
      expect { subject }.to change(Like, :count).by(-1)
    end

    it { is_expected.to be_redirect }
  end
end
