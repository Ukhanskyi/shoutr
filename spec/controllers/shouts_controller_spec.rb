# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoutsController, type: :controller do
  render_views

  let!(:user)  { FactoryBot.create(:user) }
  let!(:shout) { FactoryBot.create(:shout, user: user) }

  before do
    sign_in_as(user)
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
    context 'with valid params' do
      let!(:text_shout_params) do
        { shout: { content_type: 'TextShout', content: FactoryBot.attributes_for(:text_shout) } }
      end
      let!(:photo_shout_params) do
        { shout: { content_type: 'PhotoShout', content: FactoryBot.attributes_for(:photo_shout) } }
      end

      it 'creates new text shout' do
        expect { post :create, params: text_shout_params }.to change(Shout, :count).by(1)
      end

      it 'creates new photo shout' do
        expect { post :create, params: photo_shout_params }.to change(Shout, :count).by(1)
      end
    end

    context 'with invalid params' do
      let!(:params) { { shout: { content_type: 'TextShout' } } }

      it 'fails to create new shout' do
        expect { subject }.not_to change(Shout, :count)
      end
    end
  end
end
