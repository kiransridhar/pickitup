require "rails_helper"

feature "visits homepage", %{
  As a guest, I want to visit the homepage and see a list of courts
  So that I can decide where to play.

  Acceptance Criteria:
  -[ ] I see the title of the website
  -[ ] I see a list of courts in descending order
} do
  scenario "visits homepage" do

    visit root_path
    expect(page).to have_content "Courts"
  end

end