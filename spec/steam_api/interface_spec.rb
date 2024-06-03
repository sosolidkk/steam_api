# frozen_string_literal: true

RSpec.describe SteamApi do
  it 'has a version number' do
    expect(SteamApi::VERSION).not_to be nil
  end
end
