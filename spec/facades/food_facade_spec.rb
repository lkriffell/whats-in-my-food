require 'rails_helper'

RSpec.describe 'food facade' do
  it 'returns dishe objects' do
    VCR.use_cassette('facade spec') do
      dishes = FoodFacade.dishes_with_ingredient('sugar')

      expect(dishes).to be_an(Array)
      expect(dishes.first.description).to eq('SUGAR')
      expect(dishes.first.id).to eq('041493647402')
      expect(dishes.first.ingredients).to eq('SUGAR. ')
      expect(dishes.first.owner).to eq('Food Services Of America, Inc.')
    end
  end
end
