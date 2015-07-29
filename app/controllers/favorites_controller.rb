class FavoritesController < ApplicationController
  def create
    Favorite.find_or_create_by(favorite_params)
    redirect_to movies_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:year, :title)
  end
end