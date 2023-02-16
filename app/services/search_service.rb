class SearchService 
    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']
  
    def self.search(query)
        response = HTTParty.get("https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{@app_id}&app_key=#{@app_key}")
   
        recipes = response['hits']

        recipes.map do |recipe|
            recipe['recipe']['label']
        end
    end

end  

  