require 'spec_helper'

RSpec.describe SteamApi::Structs::PlayerGameStats do
  subject { described_class.new(params) }

  describe '#initialize' do
    context 'when the params are present' do
      let(:steamID) { 76561198160009756 }
      let(:gameName) { 'ELDEN RING' }
      let(:achievements) do
        [
          { name: 'ACH01', achieved: 1 },
          { name: 'ACH02', achieved: 1 },
          { name: 'ACH03', achieved: 0 },
        ]
      end
      let(:params) do
        { playerstats: { steamID: steamID, gameName: gameName, achievements: achievements } }
      end

      it { is_expected.to have_attributes(playerstats: have_attributes(steamID: steamID)) }

      it { is_expected.to have_attributes(playerstats: have_attributes(gameName: gameName)) }

      it do
        is_expected.to have_attributes(playerstats: have_attributes(achievements: contain_exactly(
          have_attributes(name: 'ACH01', achieved: 1),
          have_attributes(name: 'ACH02', achieved: 1),
          have_attributes(name: 'ACH03', achieved: 0)
        )))
      end
    end
  end
end
