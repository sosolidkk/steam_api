require 'spec_helper'

RSpec.describe SteamApi::Structs::AppGlobalAchievements do
  subject { described_class.new(params) }

  describe '#initialize' do
    context 'when the params are present' do
      let(:achievements) do
        [
          { name: 'TF_DEMOMAN_PARACHUTE_DISTANCE', percent: 5.0 },
          { name: 'TF_SCOUT_BACKSCATTER_KILL_FRIENDS_GRIND', percent: 5.099999904632568 }
        ]
      end
      let(:params) do
        { achievementpercentages: { achievements: achievements } }
      end

      it do
        is_expected.to have_attributes(achievementpercentages: have_attributes(achievements: contain_exactly(
          have_attributes(name: 'TF_DEMOMAN_PARACHUTE_DISTANCE', percent: 5.0),
          have_attributes(name: 'TF_SCOUT_BACKSCATTER_KILL_FRIENDS_GRIND', percent: 5.099999904632568)
        )))
      end
    end
  end
end
