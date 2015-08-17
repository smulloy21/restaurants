class Restaurant
  attr_reader(:name, :type, :phone, :address, :id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @phone = attributes.fetch(:phone)
    @address = attributes.fetch(:address)
    @id = attributes.fetch(:id)
  end
end
