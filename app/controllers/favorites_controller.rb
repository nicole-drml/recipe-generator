class FavoritesController < ApplicationController
  # after_action :set_favorite, only: %i[ save_recipe ]
  before_action :find_user
  after_action :create, only: %i[ save_recipe ]
  before_action :set_favorite, only: %i[ destroy ]

  def index
    @user = current_user
    @favorites = @user.favorites
  end

  def new 
    @favorite = Favorite.new
  end

  def save_recipe 
    @recipe_name = params[:variable_name]
    @recipe_url = params[:variable_url]
    @recipe_ing = params[:variable_ing]
    @recipe_image = params[:variable_image]

    render json: {name: @recipe_name, url: @recipe_url, ingredients: @recipe_ing, image: @recipe_image}

  end

  def destroy
    @favorite.destroy
  end

  private
  def create 
    @user = current_user
    @favorite = current_user.favorites.new(name: @recipe_name, url: @recipe_url, image: @recipe_image, ingredients: @recipe_ing)

    if @favorite.save
      # flash[:notice] = 'Favorite was successfully created.'
      redirect_to favorites_path
    else
      # flash[:alert] = "You've already saved this recipe."
      flash[:error] = "Something went wrong."
      redirect_to dashboard_search_path and return
    end

  end

  def find_user
    @user = current_user
  end
  
  def set_favorite
    @favorite = @user.favorites.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:name, :url, :image, :ingredients)
  end
end
