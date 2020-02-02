module Server
  class LogReader
    def initialize(file_name)
      @file_name = file_name
      @log_grouped_by_endpoint = Hash.new { |h, k| h[k] = [] }
    end

    def call
      raise Exceptions::WebServerLogMissingError unless File.exist?(file_name)

      File.open(file_name, 'r').each_line do |request_string|
        web_request = parse_log_request(request_string)
        log_grouped_by_endpoint[web_request.end_point].push(web_request)
      end

      log_grouped_by_endpoint
    end

    private

    attr_reader :file_name
    attr_accessor :log_grouped_by_endpoint

    def parse_log_request(request_string)
      end_point, ip_address = request_string.strip.split(/\s+/)
      WebRequest.new(end_point, ip_address)
    end
  end
end
