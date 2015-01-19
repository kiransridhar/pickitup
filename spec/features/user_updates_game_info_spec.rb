require "rails_helper"

feature "user updates site", %{
  As user who created a game,
  I want to update a game's information
  So that I can correct errors or provide new information
  } do

    scenario "authenticated user sees edit button on show page" do
      edit_game = FactoryGirl.create(:game)
      visit new_user_session_path

      fill_in "Email", with: edit_game.user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit game_path(edit_game)

      expect(page).to have_content(:link_or_button, "Edit")

    end
    scenario 'unauthenticated user sees edit button on show page' do
      edit_game = FactoryGirl.create(:game)

      visit game_path(edit_game)

      expect(page).to have_no_content(:link_or_button, "Edit")

    end
    scenario 'authenticated user edits game' do
      edit_game = FactoryGirl.create(:game)
      visit new_user_session_path

      fill_in "Email", with: edit_game.user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit edit_game_path(edit_game)
      fill_in "Name", with: "bunt"

      click_button "Update Game"
      expect(page).to have_content "Game updated successfully"
      expect(page).to have_content "bunt"

    end
    scenario 'authenticated user unsuccessfully edits game' do
      edit_game = FactoryGirl.create(:game)
      visit new_user_session_path

      fill_in "Email", with: edit_game.user.email
      fill_in "Password", with: "password"

      click_button "Sign in"

      visit edit_game_path(edit_game)
      fill_in "Name", with: ""

      click_button "Update Game"
      expect(page).to have_content "error"
    end
  end
