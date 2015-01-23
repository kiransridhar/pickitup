# require "rails_helper"
#
# feature "search games" do
#   scenario "fill in search form and view results" do
#     match = FactoryGirl.create(:game, name: "One on One")
#     match2 = FactoryGirl.create(:game, name: "One vs Two")
#     FactoryGirl.create(:game, name: "Ballers")
# 
#     visit games_path
#     fill_in "query", with: "One"
#     click_button "Search Games"
#
#     expect(page).to have_link("One on One", href: game_path(match))
#     expect(page).to have_link("One vs Two", href: game_path(match2))
#     expect(page).to_not have_content("Ballers")
#   end
#
#   scenario "fill in blank search" do
#     visit games_path
#     fill_in "query", with: "robots"
#     click_button "Search Games"
#
#     expect(page).to have_content("No results found")
#   end
# end
