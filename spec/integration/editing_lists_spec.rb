require 'spec_helper'

feature "Editing Lists -" do
  let!(:list) { create(:list) }
  
  before do
    visit "/"
    click_link "Edit"
  end

  scenario "Update a list" do
    fill_in "Name", :with => "household"
    click_button "Update"
    page.should have_content("List has been updated.")
    page.should have_content("household")
  end

  scenario "Cannot update a list with invalid name" do
    fill_in "Name", :with => ""
    click_button "Update List"
    page.should have_content("List has not been updated.")
    page.should have_content("Name can't be blank")
  end
end