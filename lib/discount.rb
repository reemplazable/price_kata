class Discount
  def initialize(product, options = {})
    @product = product
    @number_of_products = options[:number_of_products]
  end

  def price
    @number_of_products >= 3 ? 19.0 : @product[:price]
  end
end