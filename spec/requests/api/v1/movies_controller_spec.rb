require 'rails_helper'

describe "Movies API" do

	context "#Update" do
		it 'can update a single movie' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_movie = user.movies.create(title: 'Wizard of Oz', note: 'Make believe and flying monkeys')
			params = { title: 'Ghostbusters', note: 'When there is something weird', watched: true }
			id = added_movie.id

			patch "/api/v1/movies/#{id}", movie: {watched: true}

			expect(response).to be_success

			json = JSON.parse(response.body)

			expect(json['watched']).to eq(true)
			expect(Movie.find(id).watched).to eq(true)
		end
	end

end
