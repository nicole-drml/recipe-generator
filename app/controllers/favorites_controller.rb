class FavoritesController < ApplicationController
  # after_action :set_favorite, only: %i[ save_recipe ]
  after_action :create, only: %i[ save_recipe ]

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

  private
  def create 
    @user = current_user
    @favorite = current_user.favorites.new(name: @recipe_name, url: @recipe_url, image: @recipe_image, ingredients: @recipe_ing)

    if @favorite.save
      flash[:notice] = 'Favorite was successfully created.'
    else
      render :new
    end

    binding.pry
  end
  # def set_favorite
  #   @favorite = current_user.favorites.find(params[:id])
  # end

  def favorite_params
    params.require(:favorite).permit(:name, :url, :image, :ingredients)
  end
end
