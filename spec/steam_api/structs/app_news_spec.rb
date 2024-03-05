require 'spec_helper'

RSpec.describe SteamApi::Structs::AppNews do
  subject { described_class.new(params) }

  describe '#initialize' do
    context 'when the params are present' do
      let(:item) do
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
      let(:params) do
        {
          appnews: {
            appid: 400,
            count: 2,
            newsitems: [item]
          }
        }
      end

      it { is_expected.to have_attributes(appnews: have_attributes(appid: params[:appnews][:appid])) }

      it { is_expected.to have_attributes(appnews: have_attributes(count: params[:appnews][:count])) }

      it do
        is_expected.to have_attributes(
          appnews: have_attributes(
            newsitems: contain_exactly(
              have_attributes(
                gid: item[:gid],
                title: item[:title],
                url: item[:url],
                is_external_url: item[:is_external_url],
                author: item[:author],
                contents: item[:contents],
                feedlabel: item[:feedlabel],
                date: item[:date],
                feedname: item[:feedname],
                feed_type: item[:feed_type],
                appid: item[:appid],
                tags: item[:tags],
              )
            )
          )
        )
      end
    end
  end
end
