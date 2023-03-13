require 'rails_helper'

describe 'Edamam API' do
  it 'should return recipes for a chicken query' do
    chicken = RecipeService.get_chicken_recipe
    expect(chicken).to be_an_instance_of(Array)
  end

  describe '#call' do
    let(:query) { 'chicken' }
    let(:edamam_api_key) { ENV['EDAMAM_API_KEY'] } # your Edamam API key
    let(:edamam_api_id) { ENV['EDAMAM_API_ID'] } # your Edamam API ID

    it 'calls the Edamam API for the given search term' do
      # stub the HTTP request to Edamam API
      stub_request(:get, "https://api.edamam.com/search?q=#{query}&app_id=#{edamam_api_id}&app_key=#{edamam_api_key}")
        .to_return(status: 200, body: '{"hits": []}', headers: {})

      # call the Search service
      result = Search.new(query).call

      # assert that the Edamam API was called with the correct parameters
      expect(a_request(:get, "https://api.edamam.com/search?q=#{query}&app_id=#{edamam_api_id}&app_key=#{edamam_api_key}")).to have_been_made.once
    end
  end

end
