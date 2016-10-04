class TowForOne
  def initialize(product)
    @product = product
    @i = 0
  end

  def price
    (i % 3)== 0 ? 0 : @product[:price]
  end

  def i
    @i += 1
  end
end