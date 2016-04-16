require "../spec_helper"

describe RFC5988 do
  it "VERSION" do
    RFC5988::VERSION.should be_a(String)
  end
end
