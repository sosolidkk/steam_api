require "spec_helper"

RSpec.describe SteamApi::Structs::AppDetails::Movie do
  subject { described_class.new(params) }

  describe "#initialize" do
    let(:params) do
      {
        id: id,
        name: name,
        thumbnail: thumbnail,
        webm: webm,
        mp4: mp4,
        highlight: highlight
      }
    end

    context "when the params are present" do
      let(:id) { 256987122 }
      let(:name) { "027_2_1_UpdateTrailer_EN_ESRB M_16x9_1080" }
      let(:thumbnail) { "https://cdn.akamai.steamstatic.com/steam/apps/256987122/movie.293x165.jpg?t=1701872775" }
      let(:webm) { {max: "http://cdn.akamai.steamstatic.com/steam/apps/256987122/movie_max_vp9.webm?t=1701872775"} }
      let(:mp4) { {max: "http://cdn.akamai.steamstatic.com/steam/apps/256987122/movie_max.mp4?t=1701872775"} }
      let(:highlight) { true }

      it do
        is_expected.to have_attributes(
          id: id,
          name: name,
          thumbnail: thumbnail,
          webm: have_attributes(max: webm[:max]),
          mp4: have_attributes(max: mp4[:max]),
          highlight: highlight
        )
      end
    end

    context "when the params are missing" do
      let(:params) { {} }

      it "raises a Dry::Struct::Error" do
        expect { subject }.to raise_error(Dry::Struct::Error)
      end
    end
  end
end
