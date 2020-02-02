require 'spec_helper'
RSpec.describe Server::WebRequest do
  let(:web_request) { described_class.new(end_point, ip_address) }

  context 'with valid values' do
    let(:end_point) { '/hello' }
    let(:ip_address) { '127.0.0.1' }

    describe '#end_point' do
      it 'returns assigned end_point' do
        expect(web_request.end_point).to eq(end_point)
      end
    end

    describe '#ip_address' do
      it 'returns assigned ip_address' do
        expect(web_request.ip_address).to eq(ip_address)
      end
    end
  end

  context 'with invalid values' do
    let(:end_point) { :end_point }
    let(:ip_address) { 1234 }

    it 'raise type error for incorrect field type' do
      expect do
        described_class.new(end_point, ip_address)
      end.to raise_error Dry::Types::ConstraintError
    end
  end
end
