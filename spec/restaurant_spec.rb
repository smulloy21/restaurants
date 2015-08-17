require('spec_helper')

describe(Restaurant) do
  describe('#name') do
    it('returns the name of a restaurant') do
      test_restaurant = Restaurant.new({:name => "Mamma Lucia's", :type => 'italian', :phone => '555-5555', :address => 'Olney, MD', :id => nil})
      expect(test_restaurant.name()).to(eq("Mamma Lucia's"))
    end
  end
end
