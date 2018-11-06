require 'rails_helper'

RSpec.feature 'Managing Tasks', type: :feature do
  let(:task) { FactoryBot.create(:task, name: 'qwerty123') }

  before do
    sign_in task.user
  end

  scenario 'viewing all tasks' do
    visit project_tasks_path(task.project.id)
    expect(page).to have_content 'qwerty123'
  end

  scenario 'viewing a task' do
    visit project_task_path(task.project.id, task.id)
    expect(page).to have_content 'qwerty123'
  end

  scenario 'creating a task' do
    visit project_tasks_path(task.project.id)
    click_link 'New Task'
    expect(page).to have_current_path new_project_task_path(task.project.id)

    fill_in 'task[name]', with: 'qwerty456'
    click_button 'Create Task'
    expect(page).to have_content 'qwerty456'
  end

  scenario 'editing a task' do
    visit project_path(task.project.id)
    within 'tbody' do
      click_link 'Edit'
    end
    expect(page).to have_current_path edit_project_task_path(task.project.id, task.id)

    fill_in 'task[name]', with: 'abc123'
    click_button 'Update Task'
    expect(page).to have_content 'abc123'
  end

  scenario 'deleting a task' do
    visit project_path(task.project.id)
    within 'tbody' do
      click_link 'Destroy'
    end
    expect(page).to have_content 'Task was successfully destroyed'
  end
end
