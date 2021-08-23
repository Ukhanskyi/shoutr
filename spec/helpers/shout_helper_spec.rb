# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoutHelper, type: :helper do
  let!(:user)  { FactoryBot.create(:user, username: 'some_username') }
  let!(:shout) { FactoryBot.create(:shout) }

  before do
    sign_in_as(user)
  end

  describe '#like_button' do
    context 'without liked shout' do
      it 'returns Like' do
        expect(helper.like_button(shout)).to include('Like')
      end
    end

    context 'with liked shout' do
      before do
        user.like(shout)
      end

      it 'returns Unlike' do
        expect(helper.like_button(shout)).to include('Unlike')
      end
    end
  end
end
