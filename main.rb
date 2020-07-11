require_relative('my_enumerables')

################################## my_each ###################################
# puts "my_each Output: Array"
# array = [2,3,4]
# # p array.each {|x| print "#{x}\t"}
# p array.my_each {|x| print "#{x}\t"}
# iterator = array.each
# p iterator
# p iterator.next
# p iterator.next

# puts "my_each Output: Hash"
# require_relative('my_enumerables')
# countries_code = {
#     eritrea: 291,
#     nigeria: 234,
#     uganda: 256
# }

# p countries_code.each {|x| p x}
# p countries_code.my_each {|x| p x}

# puts "my_each Output: Range"
# p (0..10).each {|x| print "#{x}\t"}
# p (0..10).my_each {|x| print "#{x}\t"}

################################## my_each_with_index ###################################

# puts "my_each_with_index Output: Array"
# # array = [2,3,4]
# # p array.each_with_index {|x, y| print "#{x}::#{y}\t"}
# # p array.my_each_with_index {|x, y| print "#{x}::#{y}\t"}

# puts "my_each_with_index Output: Hash"
# require_relative('my_enumerables')
# countries_code = {
#     eritrea: 291,
#     nigeria: 234,
#     uganda: 256
# }

# p (countries_code.each_with_index do |x, y|
#     puts "#{x}, #{y}"
# end)

# p (countries_code.my_each_with_index do |x, y|
#     puts "#{x}, #{y}"
# end)

# puts 'my_each_with_index Output: Range'
# p(0..10).each_with_index { |x, y| print "#{x}::#{y}\t" }
# puts
# p(0..10).my_each_with_index { |x, y| print "#{x}::#{y}\t" }

################################## my_select ###################################

# puts 'my_select Output: Array'
# array = [2, 3, 4, 40, 20, 20, 9]
# array_result = array.select { |x| x > 10 }
# p array_result
# array_result = array.my_select { |x| x > 10 }
# p array_result

# puts 'my_select Output: Hash'
# countries_code = {
#   eritrea: 291,
#   nigeria: 234,
#   uganda: 256,
#   japan: 3,
#   gb: 2,
#   usa: 1
# }

# result = countries_code.select { |k, v| k.length <= 5 }
# p result
# result = countries_code.my_select { |k, v| k.length <= 5 }
# p result

# i = 0
# while i < countries_code.size
#     p countries_code.keys[i]
#     i+=1
# end

# p countries_code.keys
# p countries_code.values

# p result
# p result.keys[0]

# puts 'my_select Output: Range'
# result = (0..10).select {|x| x.even?}
# p result
# result = (0..10).my_select(&:even?)
# p result
# p (0..10).select
# p (0..10).my_select
# p(0..10).select { |x| x > 10 }
# p(0..10).my_select { |x| x > 10 }

# p 'temesghen'.select(&:empty?)
# p "temesghen".my_select {|x| x.length > 0}

# --------------------------------------------------------------------
# p %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
# p %w[ant bear cat].all?(/a/) #=> false
# p %w[ant bear cat].my_all?(/a/) #=> false
# "**********************************************************************************************************"
# p [1, 2i, 3.14, "cat"].all?(Numeric) #=> true
# p [1, 2i, 3.14, "cat"].my_all?(Numeric) #=> true
# p [nil, true, 99].all? #=> false
# p [nil, true, 99].my_all? #=> false
# # p '****************'
# p [100, true, 99].all? #=> true
# p [100, true, 99].my_all? #=> true
# p [].all? #=> true
# p [].my_all? #=> true
# p 'Using any? method with Hash   *****************'
# countries_code = {
#   eritrea: 291,
#   nigeria: 234,
#   uganda: 256,
#   japan: 3,
#   gb: 2,
#   usa: 1,
#   italy: 5
# }
# p %i[nigeria uganda eritrea].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda eritrea].my_all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda usa].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda usa].my_all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda korea].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda china].my_all? { |val| countries_code.key?(val) }

# p 'any?*****************************************************************'
# p 'Using any? method with Hash   *****************'
# countries_code = {
#   eritrea: 291,
#   nigeria: 234,
#   uganda: 256,
#   japan: 3,
#   gb: 2,
#   usa: 1
# }

# p %i[germany ethiopia eritrea].any? { |val| countries_code.key?(val) }
# p %i[germany ethiopia eritrea].my_any? { |val| countries_code.key?(val) }
# p %i[germany ethiopia france].any? { |val| countries_code.key?(val) }
# p %i[germany ethiopia france].my_any? { |val| countries_code.key?(val) }

# p "Using built in any? method with Arrays *****************"
# p %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
# p %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
# p %w[ant bear cat].any?(/d/)                        #=> false
# p %w[ant bear cat].my_any?(/d/)                        #=> false
# p %w[ant bear cat].any?(/e/)                        #=> false
# p %w[ant bear cat].my_any?(/e/)                        #=> false
# p ["Marshal", "Rumbi", "Godson", "Expedito", "Ezekiel", "Temesghen"].any?(/p/)                     #=> false
# p ["Marshal", "Rumbi", "Godson", "Expedito", "Ezekiel", "Temesghen"].my_any?(/p/)                     #=> false
# p [nil, true, 99].any?(Integer)                     #=> true
# p [nil, true, 99].my_any?(Integer)                     #=> true
# p [nil, true, 99].any?(Numeric)                     #=> true
# p [nil, true, 99].my_any?(Numeric)                     #=> true
# p [nil, true, 99].any?(Float)                     #=> false
# p [nil, true, 99].my_any?(Float)                     #=> false
# p [nil, true, 99].any?                              #=> true
# p [nil, true, 99].my_any?                              #=> true
# p [].any?                                           #=> false
# p [].my_any?                                           #=> false
# p [nil, nil, nil].any?                              #=> false
# p [nil, nil, nil].my_any?                              #=> false
# p [nil, false, nil].any?                              #=> false
# p [nil, false, nil].my_any?                              #=> false
# p [nil, false, 5].any?                              #=> false
# p [5, false, nil].my_any?                              #=> false

# p [1, 2i, 3.14, "one"].all?(Numeric) #=> true
# p [1, 2i, 3.14, "one"].my_all?(Numeric) #=> true
# p [nil, true, 99].all? #=> false
# p [nil, true, 99].my_all? #=> false
# p '****************'
# p [nil, true, 99].all? #=> true
# p [nil, true, 99].my_all? #=> true
# p [].all? #=> true
# p [].my_all? #=> true
# p 'Using any? method with Hash   *****************'
# countries_code = {
#   eritrea: 291,
#   nigeria: 234,
#   uganda: 256,
#   japan: 3,
#   gb: 2,
#   usa: 1,
#   italy: 5
# }
# p %i[nigeria uganda eritrea].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda eritrea].my_all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda usa].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda usa].my_all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda korea].all? { |val| countries_code.key?(val) }
# p %i[nigeria uganda china].my_all? { |val| countries_code.key?(val) }

# p %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
# p %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
# p %w{ant bear cat}.none?(/d/)                        #=> true
# p %w{ant bear cat}.my_none?(/d/)                        #=> true
# p [1, 3.14, 42].none?(Float)                         #=> false
# p [1, 3.14, 42].my_none?(Float)                         #=> false
# p [].none?                                           #=> true
# p [].my_none?                                           #=> true
# p [nil].none?                                        #=> true
# p [nil].my_none?                                        #=> true
# p [nil, false].none?                                 #=> true
# p [nil, false].my_none?                                 #=> true
# p [false, nil, 10].none?                            #=> false
# p [false, nil, 10].my_none?                           #=> false

# p 'count ********************************************************'
# result = [1, 2, 3, 4].count
# p result
# result = [1, 2, 3, 4].my_count
# p result

# result = (0..10).count(&:even?)
# p result
# result = (0..10).my_count(&:even?)
# p result

# result = [2, 3, 5, 4, 5, 5, 5, 6, 7, 8].count(5)
# p result

# result = [2, 3, 5, 4, 5, 5, 5, 6, 7, 8].my_count(5)
# p result

# p 'Using count method with Hash   *****************'
# p 'Using count method with Hash   *****************'
# countries_code = {
#   eritrea: 291,
#   nigeria: 234,
#   uganda: 256,
#   tanzania: 200,
#   china: 201,
#   japan: 3,
#   gb: 2,
#   usa: 1
# }

# result = countries_code.count { |_k, v| v > 100 }
# p result

# result = countries_code.my_count { |_k, v| v > 100 }
# p result

# puts '**********************my_map: Print Output ******************'
# result = (0..10).map {|x|  x**3}
# p result
# result = (0..10).my_map {|x|  x**3}
# p result
# (0..10).my_map {|x| p x**3}
# p "*****************8"
# (0..10).map {|x| p x**3}
# p (1..4).map {"cat"}
# p (1..4).my_map {"cat"}

# p 'Map with Hash'
# burgers = {
#   'Big Mac' => 300,
#   'Whopper with cheese' => 450,
#   "Wendy's Double with cheese" => 320
# }

# p burgers.map
# p burgers.my_map

# hash = { a: 1, b: 2, c: 3 }
# p result = hash.map { |_k, v| v * 10 }
# p result = hash.my_map { |_k, v| v * 10 }

# p multiply_els([2,4,5]) #=> 40

# puts "My Inject"
# p [3, 6, 10, 13].inject(:+) #(((3 + 6) + 10) + 13) => 32
# p [3, 6, 10, 13].my_inject(:+) #(((3 + 6) + 10) + 13) => 32
# p [3, 6, 10].inject {|sum, number| sum + number} #=>|3, 6| 3 + 6 => 9
#                                                #=>|9, 10| 9 + 10 =>19
#  p [3, 6, 10].my_inject {|sum, number| sum + number}

#  p [3, 6, 10, 13].inject(0, :+) #=> 32
#  p [3, 6, 10, 13].my_inject(0, :+) #=> 32
#  p [3, 6, 10].inject(0) {|sum, number| sum + number} #=> 19
#  p [3, 6, 10].my_inject(0) {|sum, number| sum + number} #=> 19
