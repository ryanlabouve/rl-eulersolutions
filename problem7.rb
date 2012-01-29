#
# projecteuler::problem7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, 13, we
# can see that the 6th prime is 13.
#
# What is the 10001st prime?
def is_prime?(x)
  (2..(x/2).floor).each { |index| return false if x % index == 0 }
  return true
end

primes = []

(2..300000030000003000000).each do |index|
  primes << index if is_prime? index
  if primes.length == 10001
    puts primes[-1]
    break
  end
end

