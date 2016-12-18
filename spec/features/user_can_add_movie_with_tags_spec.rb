require 'rails_helper'

RSpec.feature "User creates movie with tags" do
  scenario "see tag name in movie list after adding movie with tag", js: true do
    user = create(:user, email: "deb@tnemail.com", password: "password")
    login(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    fill_in "Title", with: "Harry and the Hendersons"
    fill_in "Note", with: "So adorable."
    fill_in "Tags (separated by commas)", with: "comedy"
    click_on "Add new movie"

    sleep(2)

    expect(Movie.count).to eq(1)
    expect(Movie.last.tags.last.name).to eq("comedy")

    within("#movies-list") do
      expect(page).to have_content("comedy")
    end

  end
end
