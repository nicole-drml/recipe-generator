class DashboardController < ApplicationController
    before_action :authenticate_user! 
    
    def index
    end
    
    def search
        @query = params[:query]
        @diet = params[:diet]
        get_api
    end

    def get_api
        if @query
            @search_response = SearchService.search(@query, @diet)
        end
    end
end
