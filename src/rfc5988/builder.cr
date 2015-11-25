require "./link_value"

module RFC5988
  module BuilderUtils
    def build_link_param(key, value)
      "#{key}=\"#{value}\""
    end

    def pack_url(url)
      "<#{url}>"
    end

    def join_build_link_parts(parts)
      parts.join("; ")
    end

    def join_build_strings(strs)
      strs.join(", ")
    end
  end

  class Builder
    include BuilderUtils

    def build(values)
      strs = if values.is_a? Array(LinkValue)
               values.map do |value|
                 parts = value.params.map { |k, v| build_link_param(k, v) }
                 parts.unshift pack_url(value.url)
                 join_build_link_parts(parts) as String
               end
             else
               [] of String
             end

      join_build_strings(strs)
    end
  end
end
