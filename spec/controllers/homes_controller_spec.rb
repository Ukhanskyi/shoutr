# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  render_views

  let!(:user) { FactoryBot.create(:user) }

  before do
    sign_in
  end

  it 'opens GET #show' do
    get :show
    expect(response).to be_successful
  end
end
