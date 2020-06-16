module Enumerable
  # ---------------------------------------------
  # MY EACH
  # ---------------------------------------------
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

  # ---------------------------------------------
  # MY EACH WITH INDEX
  # ---------------------------------------------
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

  # ---------------------------------------------
  # MY SELECT
  # ---------------------------------------------
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

  # ---------------------------------------------
  # MY ALL
  # ---------------------------------------------

  def my_all?(args = nil)
    if args.nil?
      my_each { |value| return false unless yield(value) } if block_given?
      my_each { |value| return false if value.nil? || value == false }
    else
      my_each { |value| return false unless value.match?(args) } if args.class == Regexp
      my_each { |value| return false unless value.is_a?(args) } if args.class == Module
    end
    true
  end

  # ---------------------------------------------
  # MY ANY?
  # ---------------------------------------------
  def my_any?(*args)
    if args.empty?
      if block_given?
        my_each { |value| return true if yield(value) }
      else
        my_each do |value|
          return true unless value.nil? || value == false
        end
      end
    else
      if args[0].is_a?(Regexp)
        my_each { |value| return true if value.match?(args[0]) }
        
      elsif args[0].is_a?(Module)
        my_each { |value| return true if value.is_a?(args[0]) }
      end
    end
    false
  end
  
  # ---------------------------------------------
  # MY ANY?
  # ---------------------------------------------
  def my_none?(args = nil)
    if args.nil?
      my_each { |value| return false if yield(value) } if block_given?
      my_each { |value| return false if value.nil? || value == false }
      true
    else
      my_each { |value| return false if value.match?(args) } if args.is_a? (Regexp)
      my_each { |value| return false if value.is_a?(args) } if args.is_a? (Module)
      true
    end
  end

end

# elsif is_a?(Hash)
#   my_each do |key, value|
#     hash_result[key] = value if yield(key, value)
