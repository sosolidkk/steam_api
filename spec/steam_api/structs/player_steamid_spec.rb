require 'spec_helper'

RSpec.describe SteamApi::Structs::PlayerSteamId do
  subject { described_class.new(params) }

  describe '#initialize' do
    let(:steamid) { 76561198160009756 }
    let(:message) { 'Success' }
    let(:success) { 1 }

    context 'when the params are present' do
      let(:params) do
        {
          response: {
            steamid: steamid,
            message: message,
            success: success
          }
        }
      end

      it { is_expected.to have_attributes(response: have_attributes(steamid: steamid)) }

      it { is_expected.to have_attributes(response: have_attributes(message: message)) }

      it { is_expected.to have_attributes(response: have_attributes(success: success)) }
    end

    context 'when the params are not present' do
      let(:success) { 42 }

      let(:params) do
        {
          response: {
            steamid: nil,
            message: nil,
            success: success
          }
        }
      end

      it { is_expected.to have_attributes(response: have_attributes(steamid: nil)) }

      it { is_expected.to have_attributes(response: have_attributes(message: nil)) }

      it { is_expected.to have_attributes(response: have_attributes(success: success)) }
    end
  end
end
