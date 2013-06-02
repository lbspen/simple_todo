require 'spec_helper'

feature 'Creating Lists' do
  scenario "can create a list" do
    visit '/'
    click_link 'New List'
    click_button 'Create List'
    page.should have_content('List was successfully created.')
  end
end