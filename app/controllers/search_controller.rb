class SearchController < ApplicationController

  def search
    value = params["search"]["value"]
    how = params["search"]["how"]
    @items = search_for(how, value)
    @genres = Genre.all
    @genre = Genre.find(value)
  end

  private

  def match(value)
    Item.where(name: value).or(Item.where(genre_id: value))
  end

  def search_for(how, value)
    case how
    when 'match'
      match(value)
    end
  end
end