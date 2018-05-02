class DecoratedCoach
  def initialize(couch)
    @couch = couch
  end

  def to_nil_if_blank(value)
    return nil if value.blank?

    value
  end

  def method_missing(method)
    to_nil_if_blank(@couch.send(method))
  end
end
