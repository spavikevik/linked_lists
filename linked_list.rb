require_relative 'node'

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = head
  end

  def size
    count
  end

  def append(val)
    add val do
      tail.next_node = Node.new(val)
      self.tail = tail.next_node
    end
  end

  def prepend(val)
    add val do
      new_head = Node.new(val, head)
      self.head = new_head
    end
  end

  def add(val, &add_logic)
    return self.to_s if set_value_in_head_if_empty(val)
    add_logic.call
    to_s
  end

  def at(index)
    each_with_index do |elem, i|
      return elem if i == index
    end
  end

  def find(val)
    find_index(val)
  end

  def pop
    if size == 1
      element = head.value
      head.value = nil
      return element
    else
      self.tail = at(size-2)
      (element, tail.next_node = tail.next_node.value, nil)[0]
    end
  end

  def to_s
    map {|e| "( #{e} )"}.join(' -> ') + ' -> nil'
  end

  def inspect
    to_s
  end

  def set_value_in_head_if_empty(val)
    head.value = val if head.empty?
  end

  def contains?(val)
    any? {|e| e == val}
  end

  def each
    node = head
    loop do
      break unless node
      yield node if block_given?
      node = node.next_node
    end
  end

  private :head=, :tail=, :add
end
