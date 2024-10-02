class MoviesController < ApplicationController


  def index
    @movies = Movie.all
    @released_movies = Movie.where('release_year <= ?', Date.today.year)
    @upcoming_movies = Movie.where('release_year > ?', Date.today.year)
  end
end
