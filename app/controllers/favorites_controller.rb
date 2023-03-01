class FavoritesController < ApplicationController
  after_action :set_favorite, only: %i[ save_recipe ]

  def index
    @user = current_user
    @favorites = @user.favorites
  end

    def new 
        @user = current_user
        @favorite = Favorite.new

        @recipe_name = params[:variable_name]
        @recipe_url = params[:variable_url]
        @recipe_ing = params[:variable_ing]
        @recipe_image = params[:variable_image]

        render json: {name: @recipe_name, url: @recipe_url, ingredients: @recipe_ing, image: @recipe_image}
        
    end

    def create 
      @user = current_user
      @favorite = @user.favorites.new(favorite_params)
    end

    def save_recipe 
    end

    private
 

    def favorite_params
      params.require(:category).permit(:name, :image_url, :ingredients)
    end
end
