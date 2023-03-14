class SearchService
  @app_id = ENV['EDAMAM_APP_ID']
  @app_key = ENV['EDAMAM_APP_KEY']

  def self.search(query, diet, health, cuisine, dish, exclude)
    request_url = "https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{@app_id}&app_key=#{@app_key}"

    request_url.concat("&diet=#{diet}") unless diet.empty?
    request_url.concat("&health=#{health}") unless health.empty?
    request_url.concat("&cuisineType=#{cuisine}") unless cuisine.empty?
    request_url.concat("&excluded=#{exclude}") unless exclude.empty?

    response = HTTParty.get(request_url)
    @recipes = response['hits']
  end
end
