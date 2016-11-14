class Node
  include Comparable
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def <=>(val)
    value <=> val
  end

  def ==(val)
    value == val
  end

  def eql?(val)
    self.==(val)
  end

  def to_s
    value.to_s
  end

  def inspect
    to_s
  end

  def empty?
    value.nil?
  end
end
