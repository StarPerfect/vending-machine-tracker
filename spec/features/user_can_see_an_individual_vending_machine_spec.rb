require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
end
# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price
require 'rails_helper'

RSpec.describe 'Vending Machine Show Page' do
  before :each do
    @denver_vending = Owner.create(name: 'Denver Vending Machines, Inc.')
    @turing = @denver_vending.machines.create(location: 'Turing')
    @poptarts = @turing.snacks.create(name: 'Poptarts', price: 1.00)
    @skittles = @turing.snacks.create(name: 'Skittles', price: 1.25)
  end

  it 'User sees all snacks and their price' do
    visit machine_path(@turing)

    expect(page). to have_content(@poptart.name)
    expect(page). to have_content(@poptart.price)
    expect(page). to have_content(@skittles.name)
    expect(page). to have_content(@skittles.price)
  end
end
