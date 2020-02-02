Dir[File.expand_path('**/*.rb', __dir__)].each do |file|
  require file unless file.include?('parser.rb')
end

Server::LogReporter.new(ARGV).call
