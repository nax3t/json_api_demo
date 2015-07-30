class MoviesController < ApplicationController
  def index
    # OMDB requires some query to be set or it will error
    @query = params[:query]

    response = RestClient.get("http://www.omdbapi.com/?s=#{@query}")
    @movies = JSON.parse(response.body)['Search']
  end
end