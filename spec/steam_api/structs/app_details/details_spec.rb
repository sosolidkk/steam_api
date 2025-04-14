require "spec_helper"

RSpec.describe SteamApi::Structs::AppDetails::Details do
  subject { described_class.new(params) }

  describe "#initialize" do
    let(:params) do
      {
        appid: 400,
        response: {
          success: true,
          data: {
            type: "game",
            name: "Portal",
            required_age: 0,
            is_free: false,
            developers: ["Valve"],
            publishers: ["Valve"],
            price_overview: {
              currency: "USD",
              initial: 999,
              final: 499,
              discount_percent: 50,
              initial_formatted: "$9.99",
              final_formatted: "$4.99"
            }
          }
        }
      }
    end

    context "when the params are present" do
      it { is_expected.to have_attributes(appid: 400) }

      it do
        is_expected.to have_attributes(
          response: have_attributes(
            success: true,
            data: have_attributes(
              type: "game",
              name: "Portal",
              required_age: 0,
              is_free: false,
              developers: contain_exactly("Valve"),
              publishers: contain_exactly("Valve"),
              price_overview: have_attributes(
                currency: "USD",
                initial: 999,
                final: 499,
                discount_percent: 50,
                initial_formatted: "$9.99",
                final_formatted: "$4.99"
              )
            )
          )
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
