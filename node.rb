class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
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
