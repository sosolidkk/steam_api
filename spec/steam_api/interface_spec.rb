# frozen_string_literal: true

RSpec.describe SteamApi do
  it "has a version number" do
    expect(SteamApi::VERSION).not_to be nil
  end

  it "has version 0.4.0" do
    expect(SteamApi::VERSION).to eq('0.4.0')
  end
end
