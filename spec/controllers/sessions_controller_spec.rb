# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  let!(:user) { FactoryBot.create(:user, username: 'current_user') }

  before do
    sign_in_as(user)
  end
end
