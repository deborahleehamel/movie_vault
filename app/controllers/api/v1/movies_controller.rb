class Api::V1::MoviesController < ApplicationController

  def index
    @movies = Movie.find[params[:id]]
    render json: @movies
  end

  def update
    movie = Movie.find[params[:id]]
    if params[:watched]
      movie.read = !movie.read
      movie.save
      render json: movie
    end
  end

end
