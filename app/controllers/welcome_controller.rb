class WelcomeController < ApplicationController
  def index
  end

  def movies
  	response = RestClient.get("http://www.omdbapi.com/?s=#{params[:query]}")
  	@movies = JSON.parse(response.body)
  end
end
