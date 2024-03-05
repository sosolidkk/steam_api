require 'spec_helper'

RSpec.describe SteamApi::Structs::AppNew do
  subject { described_class.new(params) }

  describe '#initialize' do
    context 'when the params are present' do
      let(:params) do
        {
          gid: "6300039510132446959",
          title: "The creator of the canceled Portal 64 demake says, 'Don't be mad at Valve here'",
          url: "https://steamstore-a.akamaihd.net/news/externalpost/PC Gamer/6300039510132446959",
          is_external_url: true,
          author: "Jody Macgregor",
          contents: "Programmer and Nintendo Jedi James Lambert has spe...",
          feedlabel: "PC Gamer",
          date: 1705280078,
          feedname: "PC Gamer",
          feed_type: 0,
          appid: 400,
          tags: nil
        }
      end

      it { is_expected.to have_attributes(gid: params[:gid]) }

      it { is_expected.to have_attributes(title: params[:title]) }

      it { is_expected.to have_attributes(url: params[:url]) }

      it { is_expected.to have_attributes(is_external_url: params[:is_external_url]) }

      it { is_expected.to have_attributes(author: params[:author]) }

      it { is_expected.to have_attributes(contents: params[:contents]) }

      it { is_expected.to have_attributes(feedlabel: params[:feedlabel]) }

      it { is_expected.to have_attributes(date: params[:date]) }

      it { is_expected.to have_attributes(feedname: params[:feedname]) }

      it { is_expected.to have_attributes(feed_type: params[:feed_type]) }

      it { is_expected.to have_attributes(appid: params[:appid]) }

      it { is_expected.to have_attributes(tags: params[:tags]) }
    end
  end
end
