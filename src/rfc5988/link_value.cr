module RFC5988
  class LinkValue
    property url
    property params

    def initialize(@url : String, @params = {} of String => String)
    end

    LINK_PARAM_KEYS = %w(rel anchor rev herflang media title type)
    {% for name, index in LINK_PARAM_KEYS %}
      def {{name.id}}
        @params[{{name}}]?
      end

      def {{name.id}}=(value : String)
        @params[{{name}}] = value
      end
    {% end %}
  end
end
