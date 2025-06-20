require 'rails_helper'

RSpec.describe "Moves", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "GET /moves" do
    it "displays the moves index page" do
      visit moves_path

      expect(page).to have_content("Moves List")
    end
  end

  describe "GET /moves/:id" do
    it "displays a specific move" do
      move = Move.create!(name: "Test Move", description: "This is a test move.")

      visit move_path(move)
      expect(page).to have_content("Test Move")
    end
  end
end
