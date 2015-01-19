require "rails_helper"

feature "User Deletes A Game", %{
  As a user,
  I want to delete a game that I created,
  So that I can remove games that arent happening.
  Acceptance Criteria:
  [ ] If i don't own the game, I should not see a delete button on the game page
  [ ] If I own the game, i should see a delete button on the game page
  } do

    let(:game) do
      FactoryGirl.create(:game)
    end

    scenario "logged in user deletes a game they created" do
      sign_in_as(game.user)

      visit game_path(game)

      click_on "Delete Game"

      expect(current_path) == games_path

      expect(page).to_not have_content game.name

    end

    scenario "non logged in user should not see delete button" do
      visit game_path(game)

      expect(page).to_not have_content(:link_or_button, "Delete Game")
    end

  end
