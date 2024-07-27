require "spec_helper"

RSpec.describe SteamApi::Structs::AppDetails::Genre do
  subject { described_class.new(params) }

  describe "#initialize" do
    let(:params) { {id: id, description: description} }

    context "when the params are present" do
      let(:id) { 3 }
      let(:description) { "RPG" }

      it { is_expected.to have_attributes(**params) }
    end

    context "when the id is nil" do
      let(:id) { nil }
      let(:description) { "RPG" }

      it "raises a Dry::Struct::Error" do
        expect { subject }.to raise_error(Dry::Struct::Error)
      end
    end

    context "when the description is nil" do
      let(:id) { 3 }
      let(:description) { nil }

      it { is_expected.to have_attributes(**params) }
    end

    context "when the params are missing" do
      let(:params) { {} }

      it "raises a Dry::Struct::Error" do
        expect { subject }.to raise_error(Dry::Struct::Error)
      end
    end
  end
end
