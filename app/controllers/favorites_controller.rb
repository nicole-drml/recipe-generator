class FavoritesController < ApplicationController
  after_action :set_favorite, only: %i[ save_recipe ]

    def new 
        @user = current_user
        @favorite = Favorite.new
    end

    def save_recipe 
        @recipe_name = params[:variable_name]
        @recipe_url = params[:variable_url]
        @recipe_ing = params[:variable_ing]
        @recipe_image = params[:variable_image]

        render json: {name: @recipe_name, url: @recipe_url, ingredients: @recipe_ing, image: @recipe_image}
        
        # @favorite = @user.favorite.new(favorite_params)
    end

    private
    def set_favorite
      Favorite.create()
    end

    def favorite_params
      params.require(:category).permit(:name, :image_url, :ingredients)
    end
end
