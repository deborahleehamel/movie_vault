class Api::V1::MoviesController < ApplicationController

  def index
    @movies = Movie.alphabetize_movies(current_user)
    render json: @movies
  end

  def update
    movie = Movie.find[params[:id]]
    if params[:watched]
      movie.watched = !movie.watched
      movie.save
      render json: movie
    end
  end

end
