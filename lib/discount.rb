class Discount
  def initialize(product, number_of_products)
    @product = product
    @number_of_products = number_of_products
  end

  def price
    @number_of_products >= 3 ? 19.0 : @product[:price]
  end
end