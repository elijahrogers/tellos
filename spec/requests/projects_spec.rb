require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe 'index' do
    context 'with valid session' do
      it 'renders a list of projects' do
        user = FactoryBot.create(:user)
        post user_session_path
      end
    end

    context 'without valid session' do
      it 'redirects to login' do
        get projects_path
        expect(response).to redirect_to unauthenticated_root_path
      end
    end
  end
end
