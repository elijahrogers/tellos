require 'rails_helper'

RSpec.feature 'Managing Projects', type: :feature do
  scenario 'viewing all projects' do
    project = FactoryBot.create(:project, name: 'qwerty123')
    sign_in project.user

    visit projects_path
    expect(page).to have_content 'Projects'
    expect(page).to have_content 'qwerty123'
  end

  scenario 'viewing a project' do
    project = FactoryBot.create(:project, name: 'qwerty123')
    sign_in project.user

    visit project_path project
    expect(page).to have_content('qwerty123')
  end

  scenario 'creating a project' do
    sign_in FactoryBot.create(:user)
    visit projects_path

    click_link('New Project')
    expect(page).to have_current_path new_project_path

    fill_in('Horizon', with: 'Near Term')
    fill_in('Name', with: 'Test 123')
    click_button('Create Project')
    expect(page).to have_content('Test 123')
  end

  scenario 'creating a project with invalid params' do
    sign_in FactoryBot.create(:user)
    visit projects_path

    click_link('New Project')
    expect(page).to have_current_path new_project_path

    click_button('Create Project')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'updating a project' do
    project = FactoryBot.create(:project)
    sign_in project.user

    visit projects_path
    click_link('Edit', match: :first)
    expect(page).to have_current_path edit_project_path(project.id)

    fill_in('Name', with: 'qwerty123')
    click_button('Update Project')
    expect(page).to have_content('qwerty123')
  end

  scenario 'updating a project with invalid params' do
    project = FactoryBot.create(:project)
    sign_in project.user

    visit projects_path
    click_link('Edit', match: :first)
    expect(page).to have_current_path edit_project_path(project.id)

    fill_in('Name', with: '')
    click_button('Update Project')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'deleting a project' do
    project = FactoryBot.create(:project)
    sign_in project.user

    visit projects_path
    click_link('Destroy', match: :first)
    expect(page).to have_content('Project was successfully destroyed')
  end

  scenario 'accessing projects while signed out' do
    visit projects_path
    expect(page).to have_current_path unauthenticated_root_path
  end
end
