require 'rails_helper'

describe 'Edamam API' do
  it 'should return recipes for a chicken query' do
    chicken = RecipeService.get_chicken_recipe
    expect(chicken).to be_an_instance_of(Array)
  end
end
