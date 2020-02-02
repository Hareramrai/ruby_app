require 'spec_helper'
RSpec.describe Server::LogReporter do
  let(:arg) { %w[./data/webserver.log] }
  subject { described_class.new(arg) }

  describe '#call' do
    context 'when log file exists' do
      let(:results_file) do
        File.expand_path('../../fixtures/log_reporter_results.txt',
                         File.dirname(__FILE__))
      end

      it 'prints the correct parsed reports' do
        final_result = File.read results_file

        expect { subject.call }.to output(final_result).to_stdout
      end
    end

    context "when log file doesn't exists" do
      let(:arg) { %w[./unknow/webserver.log] }

      it 'raise an exception of WebServerLogMissingError' do
        expect { subject.call }.to raise_error(Exceptions::WebServerLogMissingError)
      end
    end

    it 'triggers report generator with specific report' do
      allow_any_instance_of(Server::LogReader).to receive(:call).and_return({})

      expect(Server::ReportGenerator)
        .to receive(:generate).with({}, Server::Reports::MostPageViewReport)
      expect(Server::ReportGenerator)
        .to receive(:generate).with({}, Server::Reports::MostUniquePageViewReport)

      subject.call
    end
  end
end
