require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"
    save_and_open_page

    fill_in "Name", with: "Sublime Text 3"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end
