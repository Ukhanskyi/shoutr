# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoutsController, type: :controller do
  render_views

  let!(:user)       { FactoryBot.create(:user) }
  let!(:shout)      { FactoryBot.create(:shout, user: user) }
  let!(:text_shout) { FactoryBot.create(:text_shout) }

  before do
    sign_in
  end

  describe 'GET #show' do
    subject { get :show, params: { id: shout.id } }

    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it { is_expected.to render_template(:show) }
  end

  describe 'POST #create' do
    subject { post :create, params: params }

    context 'with valid params' do
      let!(:params) { { shout: { content_type: 'TextShout', content: FactoryBot.attributes_for(:text_shout) } } }

      it 'creates new shout' do
        expect { subject }.to change(Shout, :count).by(1)
      end
    end

    context 'with invalid params' do
      let!(:params) { { shout: { content_type: '', content: FactoryBot.attributes_for(:text_shout) } } }

      it 'fails to create new shout' do
        expect { subject }.not_to change(Shout, :count)
      end
    end
  end
end
