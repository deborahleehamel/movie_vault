require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  it "should have false as default on watched" do
    movie = Movie.create(title: "Jaws", note: "blood bath", user_id: 1 )

    expect(movie.watched).to eq false
  end
end
