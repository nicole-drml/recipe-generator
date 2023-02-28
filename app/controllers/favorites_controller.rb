class FavoritesController < ApplicationController

    def new 
        @user = current_user
        @favorite = Favorite.new
    end

    def create 
        @user = current_user
        @favorite = @user.favorite.new(favorite_params)
    end

    private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.require(:category).permit(:name, :image_url, :ingredients)
    end
end
