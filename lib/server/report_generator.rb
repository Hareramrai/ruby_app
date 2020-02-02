module Server
  class ReportGenerator
    def self.generate(data, reporter)
      report_data = reporter.new(data).call
      Reports::PrintReport.new(report_data, reporter::TITLE, reporter::MESSAGE).call
    end
  end
end
