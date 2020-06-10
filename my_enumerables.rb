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
    hash_result = {}
    i = 0
   while i < self.size
      if is_a?(Array) || is_a?(Range)
        result << self[i] if yield(self[i])
      elsif is_a?(Hash)
        self.my_each do |key, value|
            hash_result[key] = value if yield(key,value)
        end
      end
      i += 1
    end
    return result unless result.empty?
    return hash_result unless hash_result.empty?
  end
end
