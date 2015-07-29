class MoviesController < ApplicationController
  def index
    # OMDB requires some query to be set or it will error
    @query = params[:query] || "Godfather"

    response = RestClient.get("http://www.omdbapi.com/?s=#{@query}")
    @movies = JSON.parse(response.body)['Search']

    @favorites = Favorite.all
  end

  def favorite
  	favorite = {title: params[:title], year: params[:year]}
  	@favorite = Favorite.create(favorite)
  	redirect_to movies_path
  end
end