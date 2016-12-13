require 'rails_helper'

describe "All Movies" do

	context "#Index" do
		xit 'can return all links' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_link = user.links.create(title: 'Berney Sanders', url: 'http://berniesanders.com')

			get "/api/v1/links"

			links = JSON.parse(response.body)
			link = links.first

			expect(response).to be_success
			expect(link['title']).to eq(added_link.title)
			expect(link['url']).to eq(added_link.url)
			expect(link['read']).to eq(added_link.read)
			expect(link['user_id']).to eq(added_link.user_id)

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
