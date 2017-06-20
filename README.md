# PAF

A gem to format the elements of a Royal Mail Postcode Address File entry according to the rules described in the [Royal Mail Programmer's Guide Edition 7, Version 5.0](http://www.royalmail.com/sites/default/files/docs/pdf/programmers_guide_edition_7_v5.pdf)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paf

## Usage

May be used to format the PAF elements as an array of strings:

```ruby
Paf.format(
  building_name: '1-2',
  thoroughfare_name: 'NURSERY',
  thoroughfare_descriptor: 'LANE',
  dependent_locality: 'PENN',
  post_town: 'HIGH WYCOMBE',
  postcode: 'HP10 8LS'
)

['1-2 NURSERY LANE', 'PENN', 'HIGH WYCOMBE', 'HP10 8LS']
```

Or as a single string:

```ruby
Paf.to_s(
  building_name: '1-2',
  thoroughfare_name: 'NURSERY',
  thoroughfare_descriptor: 'LANE',
  dependent_locality: 'PENN',
  post_town: 'HIGH WYCOMBE',
  postcode: 'HP10 8LS'
)

'1-2 NURSERY LANE, PENN, HIGH WYCOMBE. HP10 8LS'
```

Or from a Paf instance:

```ruby
paf = Paf.new(
  building_name: '1-2',
  thoroughfare_name: 'NURSERY',
  thoroughfare_descriptor: 'LANE',
  dependent_locality: 'PENN',
  post_town: 'HIGH WYCOMBE',
  postcode: 'HP10 8LS'
)
paf.format

['1-2 NURSERY LANE', 'PENN', 'HIGH WYCOMBE', 'HP10 8LS']

paf = Paf.new(
  building_name: '1-2',
  thoroughfare_name: 'NURSERY',
  thoroughfare_descriptor: 'LANE',
  dependent_locality: 'PENN',
  post_town: 'HIGH WYCOMBE',
  postcode: 'HP10 8LS'
)
paf.to_s

'1-2 NURSERY LANE, PENN, HIGH WYCOMBE. HP10 8LS'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drabjay/paf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Paf project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/drabjayc/paf/blob/master/CODE_OF_CONDUCT.md).
