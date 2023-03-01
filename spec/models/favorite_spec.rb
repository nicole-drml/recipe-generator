require 'rails_helper'

RSpec.describe Favorite, type: :model do
  fixtures :users 

  describe 'creating a new favorite' do
    @user =  User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password123')
    @user.save
    it 'creates a new favorite with valid attributes' do
      favorite = @user.favorites.new(name: 'Google', image_link: 'https://www.google.com', ingredients: 'salt, pepper')
      expect(favorite).to be_valid
      expect(favorite.name).to eq('Google')
      expect(favorite.image_link).to eq('https://www.google.com')
      expect(ingredients).to eq('salt, pepper')
    end
  end
end
