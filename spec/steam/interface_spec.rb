# frozen_string_literal: true

RSpec.describe Steam do
  it "has a version number" do
    expect(Steam::VERSION).not_to be nil
  end

  it "has version 0.1.2" do
    expect(Steam::VERSION).to eq('0.1.2')
  end
end
