require "rails_helper"

RSpec.feature "User updates watched status for movie", js: true do
  context "movie is added to movie table on home page" do
    scenario "selecting watched button updates status" do
      user = create(:user, email: "deb@tnemail.com", password: "password")
      login(user)

      fill_in "Title", with: "Harry and the Hendersons"
      fill_in "Note", with: "So adorable."
      click_on "Add new movie"

      expect(page).to have_content("Harry and the Hendersons")
      expect(page).to have_content("So adorable.")
      expect(page).to have_button("Mark as Watched")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      within("#movies-table tr:nth-child(1)") do
        expect(page).to have_button("Mark as Watched")
        expect(page).not_to have_button("Mark as Unwatched")
        expect(page).not_to have_selector("#unwatched")

        click_on "Mark as Watched"

        expect(page).to have_button("Mark as Unwatched")
        expect(page).not_to have_button("Mark as Watched")

        click_on "Mark as Unwatched"

        expect(page).to have_button("Mark as Watched")
        expect(page).not_to have_button("Mark as Unwatched")
      end
    end
  end
end
