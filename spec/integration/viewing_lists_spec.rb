require 'spec_helper'

feature "Viewing Lists -" do
  let!(:list) { create (:list) }
  before do
    visit "/"
  end

  scenario "Viewing all lists" do
    page.should have_content(list.name)
  end

  scenario "Viewing a single list" do
    click_link "Show"
    page.should have_content(list.name)
    page.find_link("Back")[:href].should == lists_path
  end
end