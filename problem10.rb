# 
# projecteuler::problem10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17
#
# Find the sum of all the primes below 2million
require 'prime'

puts Prime.each.take_while{|p| p < 2000000 }.inject(:+)