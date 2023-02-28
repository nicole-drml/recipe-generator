class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :query_options

  def index; end

  def search
    @query = params[:query]
    @diet = params[:diet]
    @health = params[:health]
    @cuisine = params[:cuisine]
    @dish = params[:dish]
    get_api
  end

  def get_api
    return unless @query

    @search_response = SearchService.search(@query, @diet, @health, @cuisine, @dish)
    
    # @search_response.map do |recipe| 
    #   @url = recipe['recipe']['url']
    #   @label = recipe['recipe']['label']
    #   @image = recipe['recipe']['image']
    #   @recipe_text = recipe['recipe']['ingredients']
    #   i = 0
    #   @ingredients = ''
    #   while i < @recipe_text.count do 
    #     if i == @recipe_text.count - 1 
    #       @ingredients.concat("and #{@recipe_text[i]['food']}")
    #     else
    #       @ingredients.concat("#{@recipe_text[i]['food']},")
    #     end
    #     i += 1
    #   end
    # end

  end

  private

  def query_options
    @diet_array = ['', 'balanced', 'high-fiber', 'high-protein', 'low-carb', 'low-fat', 'low-sodium']
    @health_array = ['', 'alcohol-cocktail', 'alcohol-free', 'celery-free', 'crustacean-free', 'dairy-free',
                     'DASH', 'egg-free', 'fish-free', 'foodmap-free', 'gluten-free', 'immuno-supportive', 'keto-friendly',
                     'kidney-friendly', 'kosher', 'low-fat-abs', 'low-potassium', 'low-sugar', 'lupine-free', 'meditteranean',
                     'mollusk-free', 'mustard-free', 'no-oil-added', 'paleo', 'peanut-free', 'pescatarian', 'pork-free',
                     'red-meat-free', 'sesame-free', 'shellfish-free', 'soy-free', 'sugar-conscious', 'sulfite-free',
                     'tree-nut-free', 'vegan', 'vegetarian']
    @cuisine_array = ['', 'american', 'asian', 'british', 'caribbean', 'central europe', 'chinese',
                      'eastern europe', 'french', 'indian', 'italian', 'japanese', 'kosher', 'mediterranean', 'mexican',
                      'middle eastern', 'nordic', 'south american', 'south east asian']
    @dish_array = ['', 'biscuits and cookies', 'bread', 'cereals', 'condiments and sauces', 'desserts', 'drinks',
                   'main course', 'pancake', 'preps', 'preserve', 'salad', 'sandwiches', 'side dish', 'soup', 'starter', 'sweets']
  end
end
