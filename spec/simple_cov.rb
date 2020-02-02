if ENV['SIMPLECOV']
  require 'simplecov'

  SimpleCov.start do
    add_filter %r{^/spec/}
  end

  puts 'Collecting coverage report...'
end
