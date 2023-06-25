require 'spec_helper'

RSpec.describe SteamApi::Client do
  let(:api_key) { 'random-api-key-value' }

  describe '#configure' do
    subject do
      described_class.configure do |config|
        config.api_token = api_key
      end
    end

    it 'allows configuring the client through a block' do
      expect(subject.config.api_token).to eql(api_key)
    end
  end

  describe '#base_endpoint' do
    subject { described_class.new.base_endpoint }

    it { is_expected.to eql('https://api.steampowered.com') }
  end

  describe '#storefront_endpoint' do
    subject { described_class.new.storefront_endpoint }

    it { is_expected.to eql('https://store.steampowered.com/api/') }
  end
end
