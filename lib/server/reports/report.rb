require 'fc'
module Server
  module Reports
    class Report
      def initialize(log_grouped_by_endpoint)
        @log_grouped_by_endpoint = log_grouped_by_endpoint
        @report_data = FastContainers::PriorityQueue.new(:max)
      end

      private

      attr_reader :log_grouped_by_endpoint, :report_data
    end
  end
end
