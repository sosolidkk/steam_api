# frozen_string_literal: true

RSpec.describe Steam::Interface do
  it "has a version number" do
    expect(Steam::Interface::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
