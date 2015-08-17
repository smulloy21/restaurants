class Restaurant
  attr_reader(:name, :type, :phone, :address, :id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @phone = attributes.fetch(:phone)
    @address = attributes.fetch(:address)
    @id = attributes.fetch(:id)
  end
  define_singleton_method(:all) do
    returned_restaurants = DB.exec("SELECT * FROM restaurants;")
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch('name')
      type = restaurant.fetch('type')
      phone = restaurant.fetch('phone')
      address = restaurant.fetch('address')
      id = restaurant.fetch('id').to_i()
      restaurants.push(Restaurant.new({:name => name, :type => type, :phone => phone, :address => address, :id => id}))
    end
    restaurants
  end
  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (name, type, phone, address) VALUES ('#{@name}', '#{@type}', '#{@phone}', '#{@address}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
  define_method(:==) do |another_restaurant|
    self.name == another_restaurant.name &&
    self.type == another_restaurant.type &&
    self.phone == another_restaurant.phone &&
    self.address == another_restaurant.address &&
    self.id == another_restaurant.id
  end
end
