require 'spec_helper'

RSpec.describe SteamApi::Response do
  subject(:instance) { described_class.new(raw_response:, response_struct:, request:) }

  let(:raw_response) { instance_double(Typhoeus::Response) }
  let(:response_struct_args) { {} }
  let(:response_struct) { class_double(::SteamApi::Structs::Base, **response_struct_args) }
  let(:request_struct_args) do 
    {
      version: '1',
      interface: 'custom',
      path: 'any/',
      method: :get,
      query_params: {},
      body: {},
      needs_authorization?: false,
      endpoint_kind: :base_endpoint
    }
  end
  let(:request_struct) { instance_double(::SteamApi::Structs::Requests::Abstract, **request_struct_args) }
  let(:client) { ::SteamApi::Client.new }
  let(:request) { ::SteamApi::Request.new(request_struct:, response_struct:, client:) }

  describe '#fail?' do
    before do
      allow(raw_response).to receive(:success?).and_return(false)
    end

    context 'when the request fails' do
      it 'returns true' do
        expect(instance.fail?).to be(true)
      end
    end
  end

  describe '#status_code' do
    before do
      allow(raw_response).to receive(:code).and_return(200)
    end

    context 'when the request runs' do
      it 'returns a status code' do
        expect(instance.status_code).to eq(200)
      end
    end
  end

  describe '#to_h' do
    context 'when the request runs and the body is parseable' do
      before do
        allow(raw_response).to receive(:body).and_return("{\"appnews\":{\"appid\":400}}")
      end

      it 'return a Hash object' do
        expect(instance.to_h).to be_a(Hash)
      end

      it 'parses the body correctly' do
        expect(instance.to_h).to eq({:appnews=>{:appid=>400}})
      end
    end

    context 'when the request runs and the body is not parseable' do
      before do
        allow(raw_response).to receive(:body).and_return('["foo", "bar\\"]')
      end

      it 'returns an empty Hash object' do
        expect(instance.to_h).to eq({})
      end
    end
  end

  describe '#result' do
    let(:response_struct_args) do
      {
        appnews: {
          appid: 400
        }
      }
    end

    before do
      allow(::SteamApi::Structs::Base).to receive(:appnews)
      allow(::SteamApi::Structs::Base).to receive(:appid)
      allow(raw_response).to receive(:body).and_return("{\"appnews\":{\"appid\":400}}")
      allow(response_struct).to receive(:build_from_response).with({:appnews=>{:appid=>400}})
    end

    pending 'To be done when I figure out how to mock the abstract class'
  end
end
