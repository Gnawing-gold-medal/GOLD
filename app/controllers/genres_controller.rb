class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
      render 'index', notice: "You have created book successfully."
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def edit
  end
  
  private
    def genre_params
     params.require(:genre).permit(:name)
    end
  
end
