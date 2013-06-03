require 'spec_helper'

feature 'Deleting tasks' do
  let!(:list) { create(:list_with_tasks) }

  scenario "Deleting a task" do
    visit '/'
    click_link "Show"
    title = list.tasks[0].title
    click_link "Delete Task"
    page.should have_content("Task has been deleted.")
    page.should_not have_content(title)
  end
end
