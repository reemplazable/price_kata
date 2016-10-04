require 'spec_helper'
require 'checkout'

pricing_rules = { 'VOUCHER' => {name: 'Voucher',    price:  5.00},
                  'TSHIRT'  => {name: 'T-Shirt',    price: 20.00},
                  'MUG'     => {name: 'Coffee Mug', price:  7.50}}

describe Checkout, '#total' do
  context "with basic pricing rules: #{pricing_rules}"  do
    it 'calculates the price for scanning a Voucher' do
      checkout = Checkout.new (pricing_rules)
      checkout.scan('VOUCHER')
      expect(checkout.total).to eq 5.00
      expect(checkout.list).to eq 'Voucher'
    end

    it 'calculates the price for scanning a T-Shirt' do
      checkout = Checkout.new (pricing_rules)
      checkout.scan('TSHIRT')
      expect(checkout.total).to eq 20.00
      expect(checkout.list).to eq 'T-Shirt'
    end

    it 'calculates the price for scanning a Coffee Mug' do
      checkout = Checkout.new (pricing_rules)
      checkout.scan('MUG')
      expect(checkout.total).to eq 7.50
      expect(checkout.list).to eq 'Coffee Mug'
    end
  end

  promotion_rules = { promotions: ['VOUCHER'] }
  pricing_rules_with_promotions = pricing_rules.merge(promotion_rules)
  context "with discounted prices #{promotion_rules}" do
    it 'calculates Voucher prices with promotion of buying 3 and paying 2' do
      checkout = Checkout.new (pricing_rules_with_promotions)
      checkout.scan('VOUCHER')
      checkout.scan('VOUCHER')
      checkout.scan('VOUCHER')
      expect(checkout.total).to eq 10.00
      expect(checkout.list).to eq 'Voucher, Voucher, Voucher'
    end
  end

  discount_rules = { discounts: ['TSHIRT'] }
  pricing_rules_with_discounts = pricing_rules.merge(discount_rules)
  context "with discounted prices #{discount_rules}" do
    it 'calculates Voucher prices with promotion of buying 3 and paying 2' do
      checkout = Checkout.new (pricing_rules_with_discounts)
      checkout.scan('TSHIRT')
      checkout.scan('TSHIRT')
      checkout.scan('TSHIRT')
      expect(checkout.total).to eq 57.00
      expect(checkout.list).to eq 'T-Shirt, T-Shirt, T-Shirt'
    end
  end
end