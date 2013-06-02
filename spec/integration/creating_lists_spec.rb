require 'spec_helper'

feature 'Creating Lists -' do

  before do
    visit '/'
    click_link 'New List'
  end
  
  scenario "Create a single list" do
    name = "myList"
    fill_in(:name, :with => name)
    click_button 'Create List'
    page.should have_content('List was successfully created.')
    page.should have_content(name)
  end

  scenario "Cannot create a list without a name" do
    click_button 'Create List'
    page.should have_content("List has not been created.")
    page.should have_content("Name can't be blank")
  end

end