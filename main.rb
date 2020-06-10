require_relative('my_enumerables')

################################## my_each ###################################
# puts "my_each Output: Array"
# array = [2,3,4]
# p array.each {|x| print "#{x}\t"}
# p array.my_each {|x| print "#{x}\t"}

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
# array = [2,3,4]
# p array.each_with_index {|x, y| print "#{x}::#{y}\t"}
# p array.my_each_with_index {|x, y| print "#{x}::#{y}\t"}

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
