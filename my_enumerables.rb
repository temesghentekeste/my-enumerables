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
            hash_result[keys[i]] = self[keys[i]] if yield(keys[i],self[keys[i]])
        end
        i+=1
    end
    return result if result.size > 0
    return hash_result if hash_result.size > 0
  end
end
