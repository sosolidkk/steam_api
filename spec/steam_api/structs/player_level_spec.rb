require 'spec_helper'

RSpec.describe SteamApi::Structs::PlayerLevel do
  subject { described_class.new(params) }

  describe '#initialize' do
    context 'when the param is present' do
      let(:player_level) { 50 }
      let(:params) { { response: { player_level: player_level } } }

      it { is_expected.to have_attributes(response: have_attributes(player_level: player_level)) }
    end

    context 'when the param is not present' do
      let(:params) { { response: {} } }

      it { is_expected.to have_attributes(response: have_attributes(player_level: nil)) }
    end
  end
end
