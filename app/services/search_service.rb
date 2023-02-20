class SearchService 
    @app_id = ENV['EDAMAM_APP_ID']
    @app_key = ENV['EDAMAM_APP_KEY']
    

    def self.search(query, diet, health, cuisine, dish)
        request_url = "https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{@app_id}&app_key=#{@app_key}"
        
        if !diet.empty?  
            request_url.concat("&diet=#{diet}")
        end
        if !health.empty?    
            request_url.concat("&health=#{health}")
        end
        if !cuisine.empty?   
            request_url.concat("&cuisineType=#{cuisine}")
        end
        if !dish.empty?   
            dishstr = dish.gsub(/\s/, '%20')
            request_url.concat("&dishType=#{dishstr}")
        end
        response = HTTParty.get(request_url)
        recipes = response['hits']
       
        recipes.map do |recipe|
            recipe['recipe']['label']
        end
    end

end  

  