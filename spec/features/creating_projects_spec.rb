require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"

    fill_in "Name", with: "Sublime Text 3"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end

  scenario "with no name specified" do
    visit "/"

    click_link "New Project"

    click_button "Create Project"

    expect(page).to have_content "Project could not be created."

    within("h2") do
      expect(page).to have_content("New Project")
    end

    expect(page).to have_content("There were errors that prevented this form from
    being saved")
    expect(page).to have_content("Name must be filled")
  end
end
