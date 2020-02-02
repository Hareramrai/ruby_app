require 'dry-initializer'
require 'dry-types'

module Types
  include Dry.Types()
end

module Server
  class WebRequest
    extend Dry::Initializer
    param :end_point, Types::Strict::String
    param :ip_address, Types::Strict::String

    def ==(other)
      end_point == other.end_point && ip_address == other.ip_address
    end
  end
end
