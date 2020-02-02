module Server
  module Reports
    class MostPageViewReport < Report
      MESSAGE = 'visits'.freeze
      TITLE = 'List of webpages with most page views ordered'.freeze

      def call
        log_grouped_by_endpoint.each do |end_point, web_requests|
          report_data.push([end_point, web_requests.size], web_requests.size)
        end

        report_data
      end
    end
  end
end
