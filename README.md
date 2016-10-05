# PriceKata

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/price_kata`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'price_kata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install price_kata

## Usage

Create a checkout machine:

```ruby
    checkout = Checkout.new ({ 'VOUCHER' => {name: 'Voucher',    price:  5.00} })
```

Scan product codes:

```ruby
    checkout.scan 'VOUCHER'
```

Get the total amount and the product list:

```ruby
    checkout.total #= 5.00
    checkout.list  #= Voucher
```

## Next Steps

Generalize discounts and promotions so it can take different values. Create them through a factory for ease of use.
Allow to have more than one promotion or discount per product.
Create multiproduct (bundles) promotions and discounts.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/price_kata. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

