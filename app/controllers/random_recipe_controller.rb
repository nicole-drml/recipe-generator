class RandomRecipeController < ApplicationController
  def index; end

  def random
    # %w means word array in single quotes, for double quotes, use %W

    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']

    random_query = %w[beef chicken pork lamb vegan dessert pizza].sample

    response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{random_query}&app_id=#{@app_id}&app_key=#{@app_key}")
    recipes = response['hits']
    @random_number = rand(0..recipes.length - 1).to_i
    @random_recipe = recipes[@random_number]
  end
end
