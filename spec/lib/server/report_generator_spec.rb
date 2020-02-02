require 'spec_helper'
RSpec.describe Server::ReportGenerator do
  describe '.generate' do
    let(:reporter) { Server::Reports::MostPageViewReport }

    let(:data) do
      file_path = File.expand_path('../../fixtures/sample.log',
                                   File.dirname(__FILE__))

      Server::LogReader.new(file_path).call
    end

    let(:final_result) do
      results_file = File.expand_path('../../fixtures/sample_results.txt',
                                      File.dirname(__FILE__))

      File.read results_file
    end

    it 'prints the correct parsed reports' do
      expect { described_class.generate(data, reporter) }.to output(final_result).to_stdout
    end
  end
end
