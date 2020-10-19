require 'rails_helper'

RSpec.describe 'ingredient search' do
  it 'shows ten foods that include that ingredient' do
    VCR.use_cassette('ingredient search') do
      visit '/'

      fill_in :q, with: 'sweet potatoes'
      click_button 'Search'

      expect(current_path).to eq('/foods')

      @dishes = FoodFacade.dishes_with_ingredient('sweet potatoes')

      expect(page).to have_content('Total dishes found: 38680')
      expect(page).to have_content('SWEET POTATOES')
      expect(page).to have_content('The Pictsweet Company')
      expect(page).to have_content('C.H. Robinson Company')

      expect(@dishes.size).to eq(10)
      expect(@dishes.first.owner).to eq('The Pictsweet Company')
      expect(@dishes.last.owner).to eq('C.H. Robinson Company')
      expect(@dishes.last.id).to eq('095829400193')
      expect(@dishes.last.ingredients).to eq('ORGANIC SWEET POTATOES')
      expect(@dishes.last.description).to eq('SWEET POTATOES')
      expect(@dishes.first).to be_a(Dish)
    end
  end
end
