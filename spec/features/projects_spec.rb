require 'rails_helper'

RSpec.describe "Projects", type: :feature do
  describe 'A user views their projects' do
    context 'when signed in' do
      let(:project) { FactoryBot.create(:project, name: 'qwerty123') }

      it 'renders a list of projects' do
        sign_in project.user
        visit projects_path
        expect(page).to have_content "Projects"
        expect(page).to have_content "qwerty123"
      end
    end

    context 'when signed out' do
      it 'redirects to login' do
        visit projects_path
        expect(page).to have_current_path unauthenticated_root_path
      end
    end
  end

  describe 'A user views a project' do
    let(:project) { FactoryBot.create(:project, name: 'qwerty123') }

    context 'when signed in' do
      it 'renders a project' do
        sign_in project.user
        visit project_path project
        expect(page).to have_content('qwerty123')
      end
    end

    context 'when signed out' do
      it 'redirects to login' do
        visit project_path(project)
        expect(page).to have_current_path unauthenticated_root_path
      end
    end
  end

  describe 'A user creates a new project' do
    let(:user) { FactoryBot.create(:user) }

    context 'when signed in' do
      it 'creates a project' do
        sign_in user
        visit projects_path
        click_link('New Project')
        expect(page).to have_current_path new_project_path
        fill_in('Horizon', with: 'Near Term')
        fill_in('Name', with: 'Test 123')
        click_button('Create Project')
        expect(page).to have_content('Test 123')
      end
    end

    context 'when signed out' do
      it 'redirects to login' do
        visit projects_path
        expect(page).to have_current_path unauthenticated_root_path
      end
    end
  end
end
