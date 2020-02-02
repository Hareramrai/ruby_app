module Server
  class LogReporter
    def initialize(arg)
      @log_grouped_by_endpoint = LogReader.new(arg&.first).call
    end

    def call
      ReportGenerator
        .generate(log_grouped_by_endpoint, Reports::MostPageViewReport)

      ReportGenerator
        .generate(log_grouped_by_endpoint, Reports::MostUniquePageViewReport)
    end

    private

    attr_reader :log_grouped_by_endpoint
  end
end
