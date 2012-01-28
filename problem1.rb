#
# projecteuler.net::problem1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5
# we get 3, 5, 6, 9. The sum of these multiples is 23.
# 
# Find the sum of all multiples of 3 or 5 bellow 1000.
#
# Solution By: @ryanlabouve

puts (1...1000).find_all { |i| i % 3 == 0 or i % 5 == 0 }.inject(:+)