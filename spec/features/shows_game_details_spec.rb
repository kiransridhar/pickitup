require "rails_helper"

feature "sees the details of a game", %{
  As a guest, I want to view the details of a game, so that
  I can decide if I want to play in it

  Acceptance Criteria:
  - [ ] Must see the name of the game
  - [ ] Must see the location of the game
  - [ ] Must see username that created site
  - [ ] Must see a photo of the location (optional)
  - [ ] Must see the category of the game (optional)

  } do
    let (:test_game) do
      FactoryGirl.create(:game)
    end
    scenario "sees the name of the game" do
      visit game_path(test_game)

      expect(page).to have_content test_game.name
    end

    scenario "sees the location of the game" do
      visit game_path(test_game)

      expect(page).to have_content test_game.address
      expect(page).to have_content test_game.city
      expect(page).to have_content test_game.state
      expect(page).to have_content test_game.zip
    end
end
