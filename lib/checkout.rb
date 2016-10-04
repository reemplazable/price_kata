require 'two_for_one'
require 'discount'

class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @promotions = pricing_rules[:promotions]
    @discounts = pricing_rules[:discounts]
    @products = []
  end

  def scan(code)
    @products << @pricing_rules[code]
  end

  def total
    promotions = create_promotions
    discounts = create_discounts
    @products.map { |product|
      calculate_price(promotions, discounts, product)
    }.inject(0) { |sum, price|
      sum + price
    }
  end

  def list
    @products.map { |product| "#{product[:name]}" }.join(', ')
  end

  private

  def calculate_price(promotions, discounts, product)
    promotions[product] ? promotions[product].price : (discounts[product] ? discounts[product].price : product[:price])
  end

  def create_promotions
    @promotions ? @promotions.map { |k| { @pricing_rules[k] => TowForOne.new(@pricing_rules[k]) } }.inject(:merge) : {}
  end

  def create_discounts
    @discounts ? @discounts.map { |k| { @pricing_rules[k] => Discount.new(@pricing_rules[k], @products.count {|product| @pricing_rules[k] == product }) } }.inject(:merge) : {}
  end
end