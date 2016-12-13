require 'rails_helper'

RSpec.feature "authenticated user can add a movie"do

  context "valid movie title submitted" do
    scenario "sees link appear on index page" do

      user = User.create(email: "deb@tnemail.com", password: "password", password_confirmation: "password")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      login(user)

      fill_in "Title", with: "Pride and Prejudice"
      fill_in "Note", with: "Lovers are rediculous!"
      click_on "Add new movie"

      expect(page).to have_content("Pride and Prejudice")
      expect(page).to have_content("Lovers are rediculous!")
    end

      scenario "title must be present" do

      user = User.create(email: "deb@tnemail.com", password: "password")
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      login(user)

      visit '/movies'

      expect(user.movies.count).to eq(0)
      within(".add-movie-form") do
        fill_in "Note", with: "English countryside at craziest."
        fill_in "Title", with: ""
        click_on "Add new movie"
      end

      expect(page).to have_content("Movie title is not valid. Please try adding again.")
    end
  end
end
