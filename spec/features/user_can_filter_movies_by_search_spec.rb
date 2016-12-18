require 'rails_helper'

RSpec.feature "User filter movies in search box" do
  scenario "see only matched titles for text entered in search", js: true do
    user = create(:user, email: "deb@tnemail.com", password: "password")
    login(user)

    fill_in "Title", with: "Harry and the Hendersons"
    fill_in "Note", with: "So adorable."
    click_on "Add new movie"

    fill_in "Title", with: "Pride and Prejudice"
    fill_in "Note", with: "Lovers are rediculous!"
    click_on "Add new movie"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    fill_in "search-box", with: "Harry"

    expect(page).to have_content("Harry and the Hendersons")
    expect(page).not_to have_content("Pride and Prejudice")

  end
end
