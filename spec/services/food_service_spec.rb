require 'rails_helper'

RSpec.describe 'food service' do
  it 'returns dishes hash' do
    VCR.use_cassette('service spec') do
      data = FoodService.dishes_with_ingredient('sugar')

      expect(data).to be_a(Hash)
      expect(data[:foods]).to be_an(Array)
      expect(data[:foods].first[:gtinUpc]).to be_a(String)
      expect(data[:foods].first[:description]).to be_a(String)
      expect(data[:foods].first[:brandOwner]).to be_a(String)
      expect(data[:foods].first[:ingredients]).to be_a(String)
    end
  end
end
