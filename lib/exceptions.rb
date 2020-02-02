module Exceptions
  class WebServerLogMissingError < StandardError
    def message
      "Web Server log doesn't exists"
    end
  end
end
