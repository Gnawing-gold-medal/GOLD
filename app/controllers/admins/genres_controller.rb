class Admins::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admins_genres_path, notice: "You have updated genre successfully."
    else
      render "edit"
    end
  end
  
  private
    def genre_params
     params.require(:genre).permit(:name)
    end
  
end
