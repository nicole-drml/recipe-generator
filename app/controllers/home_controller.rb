class HomeController < ApplicationController
  def index
    response = HTTParty.get('https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=2b8378b3&app_key=887a2a49455e11b8ef7f98c6cd05c159')
    @response = JSON.parse(response.body)
  end
end
