require 'spec_helper'

feature 'Creating Lists -' do
  scenario "Create a single list" do
    visit '/'
    click_link 'New List'
    name = "myList"
    fill_in(:name, :with => name)
    click_button 'Create List'
    page.should have_content('List was successfully created.')
    page.should have_content(name)
  end
end