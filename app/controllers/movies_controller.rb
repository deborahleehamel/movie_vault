class MoviesController < ApplicationController
  def index
    if current_user
      @movies = Movie.where(user: current_user)
      @add_movie = Movie.new
    else
      render file: "public/404"
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      flash[:success] = "Movie successfully added!"
      redirect_to movies_path
    else
      flash[:error] = "Movie title is not valid. Please try adding again."
      redirect_to movies_path
    end
  end

  def update
    movie = Movie.find(params[:id])
    if params[:watched]
      movie.watched = !movie.watched
      movie.save
      redirect_to movies_path
    elsif movie_params[:title]
      movie.update(movie_params)
      redirect_to movies_path
    else
      flash[:error] = "Your movie title is invalid. Please try again."
      redirect_to edit_movie_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :note, :user, :user_id, :watched, :id)
    end

end
