require 'rails_helper'

describe "All Movies" do
	context "#Index" do
		xit 'can return all links' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_movie = user.movies.create(title: 'Wizard of Oz', note: 'Make believe and flying monkeys')

			get "/api/v1/movies"

			movies = JSON.parse(response.body)
			movie = movies.first

			expect(response).to be_success
			expect(movie['title']).to eq(added_movie.title)
			expect(movie['note']).to eq(added_movie.note)
			expect(movie['watched']).to eq(added_movie.watched)
			expect(movie['user_id']).to eq(added_movie.user_id)

		end
  end

		context "#Update" do
		xit 'can update a single movie' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_movie = user.movies.create(title: 'Wizard of Oz', note: 'Make believe and flying monkeys')
			params = { title: 'Ghostbusters', note: 'When there is something weird', watched: true }

			post "/api/v1/users/#{user.id}/movies/#{added_movie.id}", movie: params

			movies = JSON.parse(response.body)
			movie = movies.first

			expect(response).to be_success
			expect(movie['title']).to eq('Ghostbusters')
			expect(movie['note']).to eq('When there is something weird')
			expect(movie['watched']).to eq(true)
			expect(movie['user_id']).to eq(added_movie.user_id)

		end
	end


end
