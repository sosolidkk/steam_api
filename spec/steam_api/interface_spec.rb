# frozen_string_literal: true

RSpec.describe SteamApi do
  it "has a version number" do
    expect(SteamApi::VERSION).not_to be nil
  end

  it "has version 0.1.5" do
    expect(SteamApi::VERSION).to eq('0.2.1')
  end
end
