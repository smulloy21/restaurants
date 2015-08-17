require('spec_helper')

describe(Restaurant) do

  before { @test_restaurant = Restaurant.new({:name => 'Mamma Lucias', :type => 'italian', :phone => '555-5555', :address => 'Olney, MD', :id => nil})}

  describe('#name') do
    it('returns the name of a restaurant') do
      expect(@test_restaurant.name()).to(eq('Mamma Lucias'))
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

  describe('.all') do
    it('is empty at first') do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if all attributes are equal') do
      test_restaurant1 = Restaurant.new({:name => 'Mamma Lucias', :type => 'italian', :phone => '555-5555', :address => 'Olney, MD', :id => 5})
      test_restaurant2 = Restaurant.new({:name => 'Mamma Lucias', :type => 'italian', :phone => '555-5555', :address => 'Olney, MD', :id => 5})
      expect(test_restaurant1 == test_restaurant2).to(eq(true))
    end
  end

  describe('#save') do
    it('saves a restaurant to the database') do
      @test_restaurant.save()
      expect(Restaurant.all()).to(eq([@test_restaurant]))
    end
  end

  describe('id') do
    it('returns the id of a restaurant') do
      @test_restaurant.save()
      expect(@test_restaurant.id()).to(be_an_instance_of(Fixnum))
    end
  end

end
