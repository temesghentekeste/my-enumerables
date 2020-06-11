module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    index = 0
    while index < size
      if is_a?(Array)
        yield(self[index])
      elsif is_a?(Range)
        yield(to_a[index])
      elsif is_a?(Hash)
        yield([keys[index], self[keys[index]]])
      end
      index += 1
    end

    self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    index = 0
    while index < size
      if is_a?(Array)
        yield(self[index], index)
      elsif is_a?(Range)
        yield(to_a[index], index)
      elsif is_a?(Hash)
        yield([keys[index], self[keys[index]]], index)
      end
      index += 1
    end
    self
  end

  def my_select
    return enum_for(:my_select) unless block_given?

    result = []
    if is_a?(Array) || is_a?(Range)
      result = []
      my_each { |value| result << value if yield(value) }
    else
      result = {}
      my_each { |key, value| result[key] = value if yield(key, value) }
    end
    result
  end
end

# elsif is_a?(Hash)
#   my_each do |key, value|
#     hash_result[key] = value if yield(key, value)
