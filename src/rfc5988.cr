require "./rfc5988/*"

module RFC5988
  def self.parse(*args)
    Parser.new.parse(*args)
  end

  def self.build(*args)
    Builder.new.build(*args)
  end
end
