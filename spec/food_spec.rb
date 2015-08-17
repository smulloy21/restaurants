require('spec_helper')


describe(Food) do

  before { @test_food = Food.new({:name => "Pizza", :type => "Italian", :cost => 8.00, :rating => 5, :restaurant_id => 29872 }) }


  describe('#name') do
    it('returns the name of the food') do
      expect(@test_food.name()).to(eq("Pizza"))
    end
  end
  describe('#type') do
    it('returns the type of the food') do
      expect(@test_food.type()).to(eq("Italian"))
    end
  end
  describe('#cost') do
    it('returns the cost of the food') do
      expect(@test_food.cost()).to(eq(8.00))
    end
  end
  describe('#rating') do
    it('returns the rating of the food') do
      expect(@test_food.rating()).to(eq(5))
    end
  end
  describe('#restaurant_id') do
    it('returns the restaurant_id of the food') do
      expect(@test_food.restaurant_id()).to(eq(29872))
    end
  end
  describe('#save') do
    it('saves the food to the database') do
      @test_food.save()
      expect(Food.all()).to(eq([@test_food]))
    end
  end
end
