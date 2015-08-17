class Food

  attr_reader(:name, :type, :cost, :rating, :restaurant_id)

  define_method(:initialize) do |attributes|
    @name   = attributes.fetch(:name)
    @type   = attributes.fetch(:type)
    @cost   = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_method(:save) do
    DB.exec("INSERT INTO food (name, type, cost, rating, restaurant_id) VALUES ('#{@name}', '#{@type}', '#{@cost}', '#{@rating}', '#{@restaurant_id}');")
  end

  define_singleton_method(:all) do
    returned_foods = DB.exec("SELECT * FROM food;")
    foods = []
    returned_foods.each() do |food|
      name = food.fetch('name')
      type = food.fetch('type')
      cost = food.fetch('cost').to_f()
      rating = food.fetch('rating').to_i()
      restaurant_id = food.fetch('restaurant_id').to_i()
      foods.push(Food.new({:name => name, :type => type, :cost => cost, :rating => rating, :restaurant_id => restaurant_id}))
    end
    foods
  end

  define_method(:==) do |another_food|
    self.name == another_food.name &&
    self.type == another_food.type &&
    self.cost == another_food.cost &&
    self.rating == another_food.rating &&
    self.restaurant_id == another_food.restaurant_id
  end
end
