require 'spec_helper'
RSpec.describe Server::LogReader do
  subject { described_class.new(arg) }

  include_context 'log grouped by end point'

  describe '#call' do
    context 'when log file exists' do
      let(:arg) do
        File.expand_path('../../fixtures/sample.log',
                         File.dirname(__FILE__))
      end

      it 'returns web_request grouped by end_point' do
        expect(subject.call).to eq(log_grouped_by_end_point)
      end
    end

    context "when log file doesn't exists" do
      let(:arg) { './unknow/webserver.log' }

      it 'raise an exception of WebServerLogMissingError' do
        expect { subject.call }
          .to raise_error.with_message(/Web Server log doesn't exists/)
      end
    end
  end
end
