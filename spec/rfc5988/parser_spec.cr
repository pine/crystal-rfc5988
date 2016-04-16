require "../spec_helper"

module RFC5988
  class ParserUtilsImpl
    include ParserUtils
  end

  describe ParserUtils do
    utils = ParserUtilsImpl.new

    it "split_link_values" do
      utils.split_link_values(nil).should be_a(Array(String))
      utils.split_link_values(nil).should eq([] of String)

      header = "<URL1>; rel=\"next\",<URL2>; rel=\"prev\""
      utils.split_link_values(header).should eq(["<URL1>; rel=\"next\"", "URL2>; rel=\"prev\""])
    end

    it "split_link_value" do
      utils.split_link_value(nil).should be_a(Array(String))
      utils.split_link_value(nil).should eq([] of String)

      value = "<URL1>; rel=\"next\""
      utils.split_link_value(value).should eq(["<URL1>", " rel=\"next\""])
    end

    it "split_link_param" do
      utils.split_link_param("").should eq({} of String => String)
      utils.split_link_param("rel=next").should eq({"rel" => "next"})
      utils.split_link_param("rel=\"next\"").should eq({"rel" => "next"})
    end

    it "chomp_uri_reference" do
      utils.chomp_uri_reference(["<URL"]).should eq("URL")
      utils.chomp_uri_reference(["URL>"]).should eq("URL")
      utils.chomp_uri_reference(["<URL>"]).should eq("URL")
    end
  end

  describe Parser do
    it "initialize" do
      Parser.new.should be_a(Parser)
    end

    it "parse" do
      parser = Parser.new
      values = parser.parse("<URL1>; rel=\"next\"; anchor=0, <URL2>")

      values.size.should eq(2)

      values[0].url.should eq("URL1")
      values[0].rel.should eq("next")
      values[0].anchor.should eq("0")
      values[0].rev.should eq(nil)

      values[1].url.should eq("URL2")
      values[1].rel.should eq(nil)
    end
  end
end
