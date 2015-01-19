require "rails_helper"

feature "visits homepage", %{
  As a guest, I want to visit the homepage and see a list of games,
   so that I can decide where to play.
  Acceptance Criteria:
  - [ ] I see the title of the website
  - [ ] I see a list of the ten games in descending order
  } do

    let(:user) do
      FactoryGirl.create(:user)
    end

    game1 = FactoryGirl.create(:game)
    game2 = FactoryGirl.create(:game)

    scenario "visits homepage" do
      visit root_path


      expect(page).to have_content game1.name
      expect(page).to have_content game2.name
    end
  end
