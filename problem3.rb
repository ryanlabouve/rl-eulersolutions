#
# projecteuler::problem3
#
# The prime factors of 13195 are 5, 7, 13, 29.
# 
# What is the largest prime factor of the number 600851475143?
#
require 'prime'

target, prime_factors = 600851475143, []

while target > 1
  # find the next prime factor
  Prime.each do |p|
    if target % p == 0
      prime_factors << p
      target = target/p
      break
    end
  end
end

puts prime_factors.to_s