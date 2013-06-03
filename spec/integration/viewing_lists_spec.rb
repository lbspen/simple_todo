require 'spec_helper'

feature "Viewing Lists -" do
  let!(:list) { create (:list_with_tasks) }
  before do
    visit "/"
  end

  scenario "Viewing all lists" do
    page.should have_content(list.name)
    page.should have_content(1)
  end

  scenario "Viewing a single list" do
    click_link "Show"
    page.should have_content(list.name)
    page.find_link("Edit")[:href].should == edit_list_path(list)
    page.find_link("Back")[:href].should == lists_path
    page.find_link("Delete")[:href].should == list_path(list)
    page.find_link("Delete").native["data-method"].should == "delete"
    page.should have_content(list.tasks[0].title)
    page.should have_content(list.tasks[0].notes)
  end
end