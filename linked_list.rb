require_relative 'node'

class LinkedList
  attr_reader :size
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @size = 1
    @tail = head
  end

  def append(val)
    return self.to_s if set_value_in_head_if_empty(val)
    self.size += 1
    tail.next_node = Node.new(val)
    self.tail = tail.next_node
    to_s
  end

  def prepend(val)
    return self.to_s if set_value_in_head_if_empty(val)
    self.size += 1
    new_head = Node.new(val, head)
    self.head = new_head
    to_s
  end

  def at(index)
    node = head
    index.times do
      node = node.next_node
    end
    return node
  end

  def pop
    if size == 1
      element = head.value
      head.value = nil
      return element
    else
      self.tail = at(size-2)
      (element, tail.next_node, self.size = tail.next_node.value, nil, size-1)[0]
    end
  end

  def to_s
    node, string = head, ""
    while true
      break unless node
      string += "( #{node.to_s} ) -> "
      node = node.next_node
    end

    return string + "nil"
  end

  def inspect
    to_s
  end

  def set_value_in_head_if_empty(val)
    head.value = val if head.empty?
  end

  private
    attr_writer :size
end
