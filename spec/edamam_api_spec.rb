require 'rails_helper'

describe 'Edamam API' do

  describe '#call' do
    query = 'chicken'
    diet = ''
    health = ''
    cuisine = ''
    dish = ''
    exclude = ''
    edamam_api_key = ENV['EDAMAM_APP_KEY'] # your Edamam API key
    edamam_api_id = ENV['EDAMAM_APP_ID'] # your Edamam API ID
    it 'calls the Edamam API for the given search term' do
      # stub the HTTP request to Edamam API
        @request_spec = stub_request(:get, "https://api.edamam.com/api/recipes/v2?type=public&q=#{query}&app_id=#{edamam_api_id}&app_key=#{edamam_api_key}").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: "", headers: {})

      # call the Search service
      result = SearchService.search(query, diet, health, cuisine, dish, exclude)

      # assert that the Edamam API was called with the correct parameters
      expect(@request_spec).to have_been_made.once
    end
  end

end
