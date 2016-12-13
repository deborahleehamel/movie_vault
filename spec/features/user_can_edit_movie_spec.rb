require "rails_helper"

RSpec.feature "User can edit a movie" do
  context "movie has valid title" do
    scenario "changed title appears on page" do
      user = User.create(email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "TED: Ideas worth spreading"
      fill_in "Note", with: "inspiring speakers"
      click_on "Add new movie"

      click_on "Edit"

      fill_in "Note", with: "different note"
      click_on "Update Movie"
      expect(page).to have_content "different note"
      expect(page).to_not have_content "inspiring speakers"
    end
  end

end
