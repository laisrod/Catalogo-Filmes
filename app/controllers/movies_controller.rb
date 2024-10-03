class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie.draft?
      redirect_to movies_path
    end
  end  

  def new
    @movie = Movie.new
    @genres = Genre.all
    @directors = Director.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else 
      render :edit
    end 
  end

  def publish
    @movie = Movie.find(params[:id])
    @movie.publish!
    redirect_to movies_path
  end
  
  private

  def movie_params
    params.require(:movie).permit(:title, :release_year, :synopsis, :country, :duration, :director_id, :genre_id, :draft, :poster)
  end
end

