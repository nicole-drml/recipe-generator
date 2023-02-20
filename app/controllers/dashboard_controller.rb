class DashboardController < ApplicationController
    before_action :authenticate_user! 
    before_action :query_options, only: [:search]

    def index
    end
    
    def search
        @query = params[:query]
        @diet = params[:diet]
        @health = params[:health]
        get_api
    end

    def get_api
        if @query
            @search_response = SearchService.search(@query, @diet)
        end
    end

    private

    def query_options
        @diet_array = [ '', "Balanced", "High-fiber", "Low-carb", "Low-fat", "Low-sodium"]
        @health_array = [ '', 'alcohol-cocktail', 'alcohol-free', 'celery-free', 'chips']
    end
end
