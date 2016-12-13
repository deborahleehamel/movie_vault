require "rails_helper"

RSpec.feature "User updates watched status for movie" do
  context "has valid attributes" do
    scenario "movie is added to movie table on home page" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "Harry and the Hendersons"
      fill_in "Note", with: "So adorable."
      click_on "Add new movie"
      expect(page).to have_css '.unwatched'

      click_on "Mark as Watched"

      expect(page).to have_content "Mark as Unwatched"
      expect(page).to have_css '.watched'
      expect(page).to_not have_content "Mark as Watched"
      expect(page).to_not have_css '.unwatched'
    end
  end
end
