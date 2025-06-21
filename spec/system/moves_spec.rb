require 'rails_helper'

RSpec.describe "Moves", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:move) { moves(:first) }

  describe "GET /moves" do
    it "displays the moves index page" do
      visit moves_path
      click_link move.name

      assert_selector "h1", text: move.name
    end
  end

  describe "GET /moves/new" do
    it "displays the new move form" do
      visit moves_path
      assert_selector "h1", text: "Moves List"

      click_link "New Move"
      fill_in "Name", with: "Test Move"
      fill_in "Description", with: "This is a test move."

      click_on "Create Move"
      assert_selector "h1", text: "Moves List"
      expect(page).to have_content("Test Move")
    end
  end

  describe "GET /moves/:id" do
    it "displays a specific move" do
      visit move_path(move)

      expect(page).to have_content("Back to Moves")
      expect(page).to have_content("First Move")
    end
  end

  describe "GET /moves/:id/edit" do
    it "displays the edit move form" do
      visit edit_move_path(move)

      expect(page).to have_content("Edit Move")
      fill_in "Name", with: "Updated Move"
      fill_in "Description", with: "This is an updated move."

      click_on "Update Move"
      expect(page).to have_content("Updated Move")
      expect(page).to have_content("This is an updated move.")
    end
  end

  describe "DELETE /moves/:id" do
    it "deletes a move" do
      visit move_path(move)

      expect {
        click_on "Delete"
      }.to change(Move, :count).by(-1)

      expect(page).not_to have_content(move.name)
    end
  end
end
