require 'spec_helper'

feature "Editing tasks" do

  let!(:list) { create(:list_with_tasks) }

  before do
    visit '/'
    click_link "Show"
    click_link "Edit Task"
  end

  scenario "Updating a task" do
    title = list.tasks[0].title
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Task"
    page.should have_content "Task has been updated."
    page.should have_content("Make it really shiny!")
    page.should_not have_content title
  end

  scenario "Updating a task with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Task"
    page.should have_content("Task has not been updated.")
    page.should have_content("Title can't be blank")
  end
end