require "./rfc5988/*"

# [RFC 5988](https://tools.ietf.org/html/rfc5988) is a standard of Web Linking.
# The specification uses HTTP Header named `Link`,
# and is used by many Web API as
# [GitHub API](https://developer.github.com/guides/traversing-with-pagination/).
#
# For example,
# there are HTTP response headers of GitHub API:
#
# ```
# Link: <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=15>; rel="next",
#   &lt;https://api.github.com/search/code?q=addClass+user%3Amozilla&page=34>; rel="last",
#   &lt;https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1&>; rel="first",
#   &lt;https://api.github.com/search/code?q=addClass+user%3Amozilla&page=13>; rel="prev"
# ```
#
# This library can parse a `Link` header value of RFC 5988, and also build it.
# If you want to parse a `Link` header value, see example as following.
#
# ```crystal
# require "rfc5988"
#
# values = RFC5988.parse("<http://www.example.com/next.html>; rel=\"next\"")
# p values[0].url # => "http://www.example.com/next.html"
# p values[0].rel # => "next"
# ```
#
# If you want to build a `Link` header value, see example as following.
#
# ```crystal
# require "rfc5988"
#
# values = [ LinkValue.new("http://www.example.com", { "rel" => "next" }) ]
# p RFC5988.build(values) # => "<http://www.example.com>; rel=\"next\""
# ```
#
module RFC5988
  # Parse `Link` header value from string
  def self.parse(*args)
    Parser.new.parse(*args)
  end

  # Build `Link` header value from array of LinkValue
  def self.build(*args)
    Builder.new.build(*args)
  end
end
