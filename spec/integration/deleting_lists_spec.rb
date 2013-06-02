require 'spec_helper'

feature "Deleting a list -" do
  scenario "Deleting a list" do
    list = create(:list)
    value = list.name
    visit "/"
    page.should have_content(value)
    click_link "Delete"
    page.should have_content("List has been deleted.")
    page.should_not have_content(value)
  end
end