class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies 
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to @genre, notice: 'Gênero cadastrado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path(@genre)
    else 
      render :edit
    end 
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
