require "rails_helper"

feature "Admin edits and or deletes game", %{
  As admin I want to edit or delete a game
  So that I can remove innappropriate content

  Acceptance Criteria:
  When I delete the game, it no longer appears in the game's view
  an error message
  When I edit the game's details, the updated details
  are shown on the game's page
  } do

    let(:user) do
      FactoryGirl.create(:user, role: 2)
    end

    let(:new_game) do
      FactoryGirl.create(:game)
    end

    scenario "admin visits game's details" do
      sign_in_as(user)
      visit game_path(new_game)
      click_on "Edit"
      fill_in "game[state]", with: "New Jersey"
      click_on "Update Game"
      expect(page).to have_content "New Jersey"
    end

    scenario "admin deletes game" do
      sign_in_as(user)
      visit game_path(new_game)

      click_on "Delete Game"
      expect(page).to_not have_content new_game.name
    end
  end
