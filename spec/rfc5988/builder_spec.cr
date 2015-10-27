require "../spec_helper"

module RFC5988
  class BuilderUtilsImpl
    include BuilderUtils
  end

  describe BuilderUtils do
    utils = BuilderUtilsImpl.new

    it :build_link_param do
      utils.build_link_param("key", "").should eq("key=\"\"")
      utils.build_link_param("key", "value").should eq("key=\"value\"")
    end

    it :pack_url do
      utils.pack_url("").should eq("<>")
      utils.pack_url("URL").should eq("<URL>")
    end

    it :join_build_link_parts do
      utils.join_build_link_parts([] of String).should eq("")
      utils.join_build_link_parts(["URL"]).should eq("URL")
      utils.join_build_link_parts(["URL", "foo", "bar"]).should eq("URL; foo; bar")
    end

    it :join_build_strings do
      utils.join_build_strings([] of String).should eq("")
      utils.join_build_strings(["foo"]).should eq("foo")
      utils.join_build_strings(["foo", "bar"]).should eq("foo, bar")
    end
  end

  describe Builder do
    it :initialize do
      Builder.new.should be_a(Builder)
    end

    it :build do
      builder = Builder.new
      builder.build(nil).should eq("")
      builder.build([] of LinkValue).should eq("")

      values = [
        LinkValue.new("URL1"),
        LinkValue.new("URL2", { "key" => "value" }),
      ]
      builder.build(values).should eq("<URL1>, <URL2>; key=\"value\"")
    end
  end
end
