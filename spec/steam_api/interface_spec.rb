# frozen_string_literal: true

RSpec.describe SteamApi do
  it "has a version number" do
    expect(SteamApi::VERSION).not_to be nil
  end

  it "has version 0.2.2" do
    expect(SteamApi::VERSION).to eq('0.2.2')
  end
end
