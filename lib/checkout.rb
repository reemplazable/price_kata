class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @products = []
  end

  def scan(code)
    @products << @pricing_rules[code]
  end

  def total
    @products.inject(0) { |sum, product|
      sum + product[:price]
    }
  end

  def list
    @products.map { |product| "#{product[:name]}" }.join(" ")
  end
end