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
      my_each { |value| return false if !value.is_a?(args) } if args.class == Class
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

      elsif args[0].is_a?(Class)
        my_each { |value| return true if value.is_a?(args[0]) }
      end
    end
    false
  end

  # ---------------------------------------------
  # MY NONE?
  # ---------------------------------------------
  def my_none?(args = nil)
    if args.nil?
      my_each { |value| return false if yield(value) } if block_given?
      my_each { |value| return false unless value.nil? || value == false } unless block_given?
      true
    else
      my_each { |value| return false if value.match?(args) } if args.is_a? Regexp
      my_each { |value| return false if value.is_a?(args) } if args.is_a? Class
      true
    end
  end

  def my_count(num = nil)
    count = 0
    if num.nil?
      if block_given?
        my_each { |value| count += 1 if yield(value) }
      else
        count = size
      end
    else
      my_each do |value|
        count += 1 if num == value
      end
    end
    count
 end

  # ---------------------------------------------
  # MY MAP
  # ---------------------------------------------
  def my_map
    if block_given?
      result = []
      if is_a?(Array) || is_a?(Range)
        my_each { |value| result << yield(value) }
      elsif is_a?(Hash)
        my_each { |k, v| result << yield(k, v) }
      end
      result
    else
      enum_for(:my_map)
    end
   end

  # ---------------------------------------------
  # MY INJECT
  # ---------------------------------------------

  def my_inject(initial = nil, second = nil)
    arr = is_a?(Array) ? self : to_a
    sym = initial if initial.is_a?(Symbol) || initial.is_a?(String)
    acc = initial if initial.is_a? Integer

    if initial.is_a?(Integer)
      sym = second if second.is_a?(Symbol) || second.is_a?(String)
    end

    if sym
      arr.my_each { |x| acc = acc ? acc.send(sym, x) : x }
    elsif block_given?
      arr.my_each { |x| acc = acc ? yield(acc, x) : x }
    end
    acc
  end
end

# ---------------------------------------------
# MULTIPLY_ELS METHOD
# ---------------------------------------------

def multiply_els(arr)
  arr.my_inject(:*)
end
