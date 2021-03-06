Dir[File.join(File.dirname(__FILE__), '..', '**.rb')].each do |f|
  require f
end

RSpec.configure do |config|
  config.include JsonSpec::Helpers

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end
