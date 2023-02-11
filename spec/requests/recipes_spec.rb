require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /recipes' do
    it 'should return all recipes' do
      get recipes_path
      expect(response).to have_http_status(200)
    end
  end
end
