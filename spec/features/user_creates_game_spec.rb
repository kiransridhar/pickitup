require "rails_helper"

feature "user creates", %{
  As a user
  I want to be able to create a game
  So that I can play with others
  } do

    scenario "if signed in" do

      game = FactoryGirl.create(:game)
      user = User.find(game.user_id)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit new_game_path
      expect(page).to have_content "Organize a New Game"

      attach_file("game[image]", File.join(
      Rails.root, "spec/data/basketball-366x275.jpg")
      )

      fill_in "Name", with: game.name
      fill_in "Address", with: game.address
      fill_in "City", with: game.city
      fill_in "State", with: game.state
      fill_in "Zip", with: game.zip

      click_on "Create Game"

      expect(page).to have_content game.name
      expect(page).to have_content game.address
      expect(page).to have_content game.city
      expect(page).to have_content game.state
      expect(page).to have_content game.zip
      expect(page).to have_content "Edit"
      expect(page).to have_content "Game created successfully"

    end
    scenario "game is not created successfully" do
      game = FactoryGirl.create(:game)
      user = User.find(game.user_id)

      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit new_game_path

      click_button "Create Game"
      expect(page).to have_content "error"

    end

    scenario "user sees create game" do

      user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in "Email", with: user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit games_path

      expect(page).to have_content "Create New Game"
    end
  end
