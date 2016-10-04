require 'spec_helper'
require 'checkout'

pricing_rules = { 'VOUCHER' => {name: 'Voucher',    price:  5.00},
                  'TSHIRT'  => {name: 'T-Shirt',    price: 20.00},
                  'MUG'     => {name: 'Coffee Mug', price:  7.50}}

describe Checkout, '#total' do
  context "with pricing rules: #{pricing_rules}"  do
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
end