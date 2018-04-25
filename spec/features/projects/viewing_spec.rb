require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:project_repo) { ProjectRepository.new(ROM.env) }
  let!(:project) { project_repo.create(name: "Sublime Text 3") }

  scenario "with the project details" do
    visit "/"
    click_link "Sublime Text 3"
    expect(page.current_url).to eq projects_project_url(project)
    within("h2") do
      expect(page).to have_content("Sublime Text 3")
    end
  end
end
