require 'spec_helper'

RSpec.describe Server::Reports::MostUniquePageViewReport do
  include_context 'log grouped by end point'

  subject { described_class.new(log_grouped_by_end_point) }

  let(:report_result) do
    [
      ['/help_page/1', 2],
      ['/contact', 1],
      ['/about/2', 1],
      ['/home', 1]
    ]
  end

  describe '#call' do
    it 'returns computed report inform of priority_queue_object' do
      expect(get_result_from_queue(subject.call)).to eq(report_result)
    end
  end
end
