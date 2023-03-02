require 'rails_helper'

RSpec.describe Favorite, type: :model do
  fixtures :users 

  describe 'creating a new favorite' do
    let(:user) { create(:user) }   
    let(:valid_attributes) { { user_id: user.id, name: 'Google', url: 'https://www.google.com', image: 'https://www.image-google.com',ingredients: 'salt, pepper' } }
    # let(:invalid_attributes) { { name: '', user_id: user.id } }
    # @user =  User.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password: 'password123')
    # @user.save
    
    context 'with valid parameters' do
      it 'creates a new favorite' do
        expect {
          post :create, params: { user_id: user.id, favorite: valid_attributes }
        }.to change(Favorite, :count).by(1)
      end
    end
    
    it 'creates a new favorite with valid attributes' do
      @favorite = favorites.create(user_id: user.id, name: 'Google', url: 'https://www.google.com', image: 'https://www.image-google.com',ingredients: 'salt, pepper')
      expect(favorite).to be_valid
      expect(favorite.name).to eq('Google')
      expect(favorite.url).to eq('https://www.google.com')
      expect(favorite.image).to eq('https://www.image-google.com')
      expect(ingredients).to eq('salt, pepper')
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:valid_attributes) { { name: 'Google', user_id: user.id } }
    let(:invalid_attributes) { { name: '', user_id: user.id } }

    context 'with valid parameters' do
      it 'creates a new favorite' do
        expect {
          post :create, params: { user_id: user.id, favorite: valid_attributes }
        }.to change(Favorite, :count).by(1)
      end

      it 'redirects to the user show page' do
        post :create, params: { user_id: user.id, favorite: valid_attributes }
        expect(response).to redirect_to(user_path(user))
      end
    end
  end
end
