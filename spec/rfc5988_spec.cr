require "./spec_helper"

module RFC5988
  describe RFC5988 do
    it :parse do
      values = RFC5988.parse("<URL1>; rel=\"next\"")
      values.size.should eq(1)
      values[0].url.should eq("URL1")
      values[0].rel.should eq("next")
    end

    it :build do
      header = RFC5988.build([LinkValue.new("URL1", {"rel" => "next"})])
      header.should eq("<URL1>; rel=\"next\"")
    end
  end
end
