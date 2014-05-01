class Fixnum
  def around
    (pred..succ).to_a
  end
end

class Array
  def neighbours
    Set.new first.around.product(last.around) - [self]
  end
end
