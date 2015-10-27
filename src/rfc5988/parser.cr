require "./link_value"

module RFC5988
  module ParserUtils
    def split_link_values(header)
      if header
        header.split(/,\s*</)
      else
        [] of String
      end
    end

    def split_link_value(value)
      if value
        value.split(/;/)
      else
        [] of String
      end
    end

    def split_link_param(param)
      if param.match(/\s*(.+)\s*=\s*"?([^"]+)"?/)
        {"#{$1}" => $2}
      else
        {} of String => String
      end
    end

    def chomp_uri_reference(values)
      values.first { "" }.gsub(/[<>]/, "")
    end
  end

  class Parser
    include ParserUtils

    def parse(header)
      values = split_link_values(header)
      values.map do |value|
        parts = split_link_value(value)
        uri = chomp_uri_reference(parts)
        params = {} of String => String

        parts.shift?
        parts.each do |part|
          params.merge! split_link_param(part)
        end

        LinkValue.new(uri, params)
      end
    end
  end
end
