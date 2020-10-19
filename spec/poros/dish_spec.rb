require 'rails_helper'

RSpec.describe 'dish' do
  it 'can exist' do
    atts = {
      gtinUpc: '0987345',
      brandOwner: 'Logan',
      description: 'Really good',
      ingredients: 'Lots of sugar'
    }

    dish = Dish.new(atts)

    expect(dish).to be_a(Dish)
    expect(dish.id).to eq('0987345')
    expect(dish.owner).to eq('Logan')
    expect(dish.description).to eq('Really good')
    expect(dish.ingredients).to eq('Lots of sugar')
  end
end
