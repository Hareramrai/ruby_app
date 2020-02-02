module Server
  module Reports
    class PrintReport
      def initialize(report_data, title, message)
        @report_data = report_data
        @title = title
        @message = message
      end

      def call
        add_break_space
        puts title
        puts "Webpage(Endpoint) \t \t Count"

        report_data.pop_each do |data|
          puts "#{data[0].ljust(30, ' ')} \t #{data[1]} #{message}"
        end
      end

      private

      attr_reader :report_data, :title, :message

      def add_break_space
        puts "\n"
      end
    end
  end
end
