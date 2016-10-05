require 'two_for_one'
require 'discount'

class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    promotions = pricing_rules[:promotions]||=[]
    discounts = pricing_rules[:discounts]||=[]
    @promotions_and_discounts = promotions + discounts
    @products = []
  end

  def scan(code)
    @products << @pricing_rules[code]
  end

  def total
    promotions_and_discounts = create_promotions_and_discounts
    @products.map { |product|
      calculate_price(promotions_and_discounts, product)
    }.inject(0) { |sum, price|
      sum + price
    }
  end

  def list
    @products.map { |product| "#{product[:name]}" }.join(', ')
  end

  private

  PROMOTIONS_AND_DISCOUNTS = {'TSHIRT' => Discount, 'VOUCHER' => TowForOne}

  def calculate_price(promotions_and_discounts, product)
    promotions_and_discounts[product] ? promotions_and_discounts[product].price : product[:price]
  end

  def create_promotions_and_discounts
    @promotions_and_discounts.any? ? @promotions_and_discounts.map { |k|
      { @pricing_rules[k] => PROMOTIONS_AND_DISCOUNTS[k].new(@pricing_rules[k], number_of_products: @products.count {|product| @pricing_rules[k] == product }) }
    }.inject(:merge) : {}
  end
end