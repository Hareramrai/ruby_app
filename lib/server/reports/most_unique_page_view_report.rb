module Server
  module Reports
    class MostUniquePageViewReport < Report
      MESSAGE = 'unique views'.freeze
      TITLE = 'List of webpages with most unique page views also ordered'.freeze

      def call
        log_grouped_by_endpoint.each do |end_point, web_requests|
          unique_ip_requests = web_requests
            .each_with_object(Hash.new(0)) do |request, unique_requests|
            unique_requests[request.ip_address] += 1
          end

          report_data.push(
            [end_point, unique_ip_requests.size],
            unique_ip_requests.size
          )
        end

        report_data
      end
    end
  end
end
