# RFC5988 - Link Header [![Build Status](https://travis-ci.org/pine613/crystal-rfc5988.svg?branch=master)](https://travis-ci.org/pine613/crystal-rfc5988) [![docrystal.org](http://docrystal.org/badge.svg?style=round)](http://docrystal.org/github.com/pine613/crystal-rfc5988)

Crystal implementation of [RFC5988](https://tools.ietf.org/html/rfc5988) parser and builder.

## Installation

Add it to `shard.yml`

```yaml
dependencies:
  rfc5988:
    github: pine613/crystal-rfc5988
    branch: master
```

## Usage

```crystal
require "rfc5988"

values = RFC5988.parse("<http://www.example.com>; rel=\"prev\"")

p values[0].url # => "http://www.example.com"
p values[0].rel # => "prev"

p RFC5988.build(values) # => "<http://www.example.com>; rel=\"prev\""
```

## Contributing

1. Fork it ( https://github.com/pine613/crystal-rfc5988/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
6. Acknowledgement

## License

MIT License
