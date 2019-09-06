# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.

require 'rails_helper'

RSpec.describe 'Snack Show Page' do
  before :each do
    @denver_vending = Owner.create(name: 'Denver Vending Machines, Inc.')
    @turing = @denver_vending.machines.create(location: 'Turing')
    @pepsi_center = @denver_vending.machines.create(location: 'Pepsi Center')
    @du = @denver_vending.machines.create(location: 'University of Denver')
    @poptarts = Snack.create(name: 'Poptarts', price: 2.00)
    @skittles = Snack.create(name: 'Skittles', price: 1.00)
    @turing.snacks << @skittles
    @turing.snacks << @poptarts
    @du.snacks << @poptarts
    @pepsi_center.snacks << @poptarts
  end

  it 'displays name and price' do
    visit snack_path(@poptarts)

    expect(page).to have_content(@poptarts.name)
    expect(page).to have_content("$2.00")
  end

  it 'displays locations to find snack' do
    visit snack_path(@poptarts)

    expect(page).to have_content(@turing.location)
    expect(page).to have_content(@pepsi_center.location)
    expect(page).to have_content(@du.location)
  end
end
