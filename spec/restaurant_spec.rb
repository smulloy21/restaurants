require('spec_helper')

describe(Restaurant) do

  before { @test_restaurant = Restaurant.new({:name => "Mamma Lucia's", :type => 'italian', :phone => '555-5555', :address => 'Olney, MD', :id => nil})}

  describe('#name') do
    it('returns the name of a restaurant') do
      expect(@test_restaurant.name()).to(eq("Mamma Lucia's"))
    end
  end

  describe('#type') do
    it('returns the type of a restaurant') do
      expect(@test_restaurant.type()).to(eq("italian"))
    end
  end

  describe('#phone') do
    it('returns the phone number of a restaurant') do
      expect(@test_restaurant.phone()).to(eq("555-5555"))
    end
  end

  describe('#address') do
    it('returns the address of a restaurant') do
      expect(@test_restaurant.address()).to(eq("Olney, MD"))
    end
  end

  describe('id') do
    it('returns the id of a restaurant') do
      expect(@test_restaurant.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
