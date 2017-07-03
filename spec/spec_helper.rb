require 'bundler/setup'
require 'paf'

RSpec.configure do |config|
  # Include any shared examples
  Dir['./spec/shared_examples/**/*.rb'].sort.each { |f| require f }

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
