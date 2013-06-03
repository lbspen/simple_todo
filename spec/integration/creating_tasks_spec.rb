require 'spec_helper'

feature "Creating Tasks -" do
  before do
    create(:list)
    visit '/'
    click_link "Show"
    click_link "New Task"
  end

  scenario "Creating a task" do
    title = "Scrub the floor"
    notes = "with a toothbrush"
    fill_in "Title", :with => title
    fill_in "Notes", :with => notes
    click_button "Create Task"
    page.should have_content("Task has been created.")
    page.should have_content(title)
    page.should have_content(notes)
    visit "/"
    page.should have_content("1")
  end

  scenario "Creating a task without valid attributes fails" do
    click_button "Create Task"
    page.should have_content("Task has not been created.")
    page.should have_content("Title can't be blank")
  end
end